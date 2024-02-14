package main

import (
	"fmt"
	"math/rand"
	"strconv"
	"strings"
)

const gridSizeX = 10
const gridSizeY = 10
const mineNumber = 14

var grid = [gridSizeX][gridSizeY]cell{}

var unopenedCells = gridSizeX * gridSizeY
var hasLost = false

func init() {
	for i := 0; i < mineNumber; i++ {
		var randX = rand.Intn(gridSizeX)
		var randY = rand.Intn(gridSizeY)
		if grid[randX][randY].isMine {
			i--
		} else {
			grid[randX][randY].isMine = true
		}
	}
	for i := 0; i < gridSizeY; i++ {
		for j := 0; j < gridSizeX; j++ {
			grid[j][i].neighbor = CountNearbyMines(j, i)
		}
	}
}

func main() {
	fmt.Println("10x10 Minesweeper")
update:
	for {
		//draw the grid
		fmt.Println("─────────────────────────────────────")
		fmt.Print("• ")
		for i := 0; i < gridSizeY; i++ {
			fmt.Print(i, " ")
		}

		fmt.Println("")
		for i := 0; i < gridSizeY; i++ {
			fmt.Print(i, " ")
			for j := 0; j < gridSizeX; j++ {
				//change the letter based on the cell state (e.g flag = f, mine = *)
				var str string
				if grid[j][i].isUnfolded {
					if grid[j][i].isMine {
						str = "*"
					} else if grid[j][i].neighbor != 0 {
						str = strconv.Itoa(grid[j][i].neighbor)
					} else {
						str = " "
					}
				} else if grid[j][i].hasFlag {
					str = "f"
				} else {
					str = "."
				}
				fmt.Print(str + " ")
			}
			fmt.Println("")
		}

		if hasLost || unopenedCells < mineNumber {
			fmt.Println("You lost :(")
			break update
		} else if unopenedCells == mineNumber {
			fmt.Println("You won!")
			break update
		}

		fmt.Println("Type your next action")
		fmt.Println("x y (U)nfold, (F)lag, Unfold (A)round")

	action:
		for {
			var row int
			var col int
			var action string
			fmt.Scanln(&row, &col, &action)

			if row < gridSizeX && row >= 0 && col < gridSizeY && col >= 0 {
				action = strings.ToUpper(action)
				switch action {
				case "U":
					Unfold(row, col)
					break action
				case "F":
					SetFlag(row, col)
					break action
				case "A":
					UnfoldAround(row, col)
					break action
				default:
					fmt.Println("Invalid action")
				}
			} else {
				fmt.Println("Invalid position")
			}
		}
	}
}

type cell struct {
	isUnfolded bool
	isMine     bool
	hasFlag    bool
	neighbor   int
}

func CountNearbyMines(x int, y int) int {
	var mines = 0
	for i := -1; i <= 1; i++ {
		for j := -1; j <= 1; j++ {
			if x+i >= 0 && x+i < gridSizeX && y+j >= 0 && y+j < gridSizeY {
				if grid[x+i][y+j].isMine {
					mines++
				}
			}
		}
	}
	return mines
}

func SetFlag(x int, y int) {
	if !grid[x][y].isUnfolded {
		grid[x][y].hasFlag = !grid[x][y].hasFlag
	}
}

func Unfold(x int, y int) {
	if !grid[x][y].hasFlag && !grid[x][y].isUnfolded {
		if grid[x][y].isMine {
			hasLost = true
		}
		grid[x][y].isUnfolded = true
		unopenedCells--
	}

	//see if there is any mines horizontally or vertically
	var mines = 0
	if x+1 < gridSizeX && grid[x+1][y].isMine {
		mines++
	}
	if x-1 >= 0 && grid[x-1][y].isMine {
		mines++
	}
	if y+1 < gridSizeY && grid[x][y+1].isMine {
		mines++
	}
	if y-1 >= 0 && grid[x][y-1].isMine {
		mines++
	}
	//if no mines were found, unfold
	if mines == 0 {
		for i := -1; i <= 1; i++ {
			if i != 0 && x+i >= 0 && x+i < gridSizeX && !grid[x+i][y].isUnfolded {
				Unfold(x+i, y)
			}
			if i != 0 && y+i >= 0 && y+i < gridSizeY && !grid[x][y+i].isUnfolded {
				Unfold(x, y+i)
			}
		}
	}
}

func UnfoldAround(x int, y int) {
	var flagsFound = 0
	//flagsFound++ for each flagged neighbor
	for i := -1; i <= 1; i++ {
		for j := -1; j <= 1; j++ {
			if !(i == 0 && j == 0) && x+i >= 0 && x+i < gridSizeX && y+j >= 0 && y+j < gridSizeY && grid[x+i][y+j].hasFlag {
				flagsFound++
			}
		}
	}

	//if flagged neighbors == cell.neighbor then unfold every other nearby cell that isn't flagged
	if flagsFound == grid[x][y].neighbor {
		for i := -1; i <= 1; i++ {
			for j := -1; j <= 1; j++ {
				if !(i == 0 && j == 0) && x+i >= 0 && x+i < gridSizeX && y+j >= 0 && y+j < gridSizeY {
					Unfold(x+i, y+j)
				}
			}
		}
	}
}
