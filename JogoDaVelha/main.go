//tic tac toe

package main

import (
	"fmt"
)

var grid = [9]string{"1", "2", "3", "4", "5", "6", "7", "8", "9"}
var turn = "X"

func main() {
end:
	for {
		//draw the grid
		fmt.Printf("%v│%v│%v\n", grid[0], grid[1], grid[2])
		fmt.Printf("─┼─┼─\n")
		fmt.Printf("%v│%v│%v\n", grid[3], grid[4], grid[5])
		fmt.Printf("─┼─┼─\n")
		fmt.Printf("%v│%v│%v\n", grid[6], grid[7], grid[8])
		fmt.Println("──────────────────────────────")

		fmt.Printf("%v: Choose a position.\n", turn)
		for {
			var pos int
			fmt.Scanln(&pos)

			if pos >= 1 && pos <= 9 && grid[pos-1] != "X" && grid[pos-1] != "O" {
				grid[pos-1] = turn
				if CheckForWin(turn) {
					fmt.Println(turn + " has won.")
					break end
				} else {
					if turn == "X" {
						turn = "O"
					} else {
						turn = "X"
					}
					break
				}
			} else {
				fmt.Println("Invalid move.")
			}
		}

		// check for draws
		var num = 0
		for i := 0; i < 9; i++ {
			if grid[i] == "X" || grid[i] == "O" {
				num++
			}
			if num == 9 {
				fmt.Println("Draw.")
				break end
			}
		}
	}
}

func CheckForWin(turn string) bool {
	var win = false
	var temp = [3][3]int{
		{0, 1, 2},
		{3, 4, 5},
		{6, 7, 8},
	}

	// |
	for i := 0; i < 3; i++ {
		if grid[temp[i][0]] == turn && grid[temp[i][1]] == turn && grid[temp[i][2]] == turn {
			win = true
		}
	}

	// ━
	for i := 0; i < 3; i++ {
		if grid[temp[0][i]] == turn && grid[temp[1][i]] == turn && grid[temp[2][i]] == turn {
			win = true
		}
	}

	// \
	if grid[temp[0][0]] == turn && grid[temp[1][1]] == turn && grid[temp[2][2]] == turn {
		win = true
	}

	// /
	if grid[temp[0][2]] == turn && grid[temp[1][1]] == turn && grid[temp[2][0]] == turn {
		win = true
	}
	return win
}
