//SGTrainee 2022 avaliacao 1

package main

import (
	"fmt"
	"strconv"
	"strings"
	"time"
)

var total int64 = 0

var fruits = map[int]Fruit{
	3500: {name: "Banana", description: "lorem ipsum.", price: 150, maxDiscount: 19, stock: 120},
	4501: {name: "Apple", description: "lorem ipsum.", price: 200, maxDiscount: 17, stock: 110},
	7001: {name: "Orange", description: "lorem ipsum.", price: 175, maxDiscount: 2, stock: 895},
	6002: {name: "Peach", description: "lorem ipsum.", price: 299, maxDiscount: 8, stock: 280},
}

func main() {

	fmt.Println("────────────────────────────────────────────────────────────────────")
	fmt.Println("LOGIN")
	fmt.Println("Type your Username and Password")

	for {
		var user string
		var password int
		fmt.Scanln(&user, &password)

		if user == "douglas" && password == 1234 {
			break
		} else {
			fmt.Println("The entered credentials are incorrect.")
		}
	}

mainSection:
	for {
		fmt.Println("────────────────────────────────────────────────────────────────────")
		fmt.Println("What would you like to do?\n(A)dd product\n(F)inish purchase\n(E)xit")

		var choice string
		fmt.Scanln(&choice)

		choice = strings.ToUpper(choice)
		switch choice {
		case "A":
			fmt.Println("────────────────────────────────────────────────────────────────────")
			fmt.Println("type 'EXIT' to exit\ntype 'ADD id quantity (discount)'")
			for {
				var input string
				var id int
				var quantity int
				var discount int //%

				fmt.Scanln(&input, &id, &quantity, &discount)

				input = strings.ToUpper(input)
				if input == "EXIT" {
					goto mainSection
				} else if input == "ADD" {
					var selectedFruit, exists = fruits[id]

					if exists && quantity > 0 && quantity <= selectedFruit.stock {
						var subTotal = int64(100-discount) * selectedFruit.price * int64(quantity) / 100
						total += subTotal
						selectedFruit.stock -= quantity
						fruits[id] = selectedFruit

						if discount > selectedFruit.maxDiscount {
							discount = selectedFruit.maxDiscount
						} else if discount < 0 {
							discount = 0
						}
						var discountStr string
						if discount != 0 {
							discountStr = fmt.Sprintf(" - %v%% Discount", discount)
						}

						fmt.Printf("%v - %v | %v (%vx %v%v) - total: %v (%v left in stock)\n", selectedFruit.name, selectedFruit.description, FormatMoney(subTotal), quantity, FormatMoney(selectedFruit.price), discountStr, FormatMoney(total), selectedFruit.stock)
					} else {
						var _error string
						if !exists {
							_error += "ID not found."
						} else {
							if quantity > selectedFruit.stock || selectedFruit.stock == 0 {
								_error += "Not enough left in stock."
							} else if quantity < 1 {
								_error += "Quantity needs to be 0 or higher."
							}
						}
						fmt.Println(_error)
					}
				} else {
					fmt.Println("Unknown command")
				}
			}
		case "F": //payment
			fmt.Println("────────────────────────────────────────────────────────────────────")
			for {
				fmt.Println("Payment")
				fmt.Println("Total: ", FormatMoney(total))
				fmt.Println("Enter the amount of money to pay")
				var amount int64
				fmt.Scanln(&amount)
				amount *= 100

				if amount < total {
					fmt.Println("Not enough money.")
				} else {
					amount -= total

					fmt.Println(" _____ _           _                  ")
					fmt.Println("|_   _| |_ ___ ___| |_    _ _ ___ _ _ ")
					fmt.Println("  | | |   | .'|   | '_|  | | | . | | |")
					fmt.Println("  |_| |_|_|__,|_|_|_,_|  |_  |___|___|")
					fmt.Println("                         |___|        ")
					fmt.Println("Thank you for your purchase!")
					fmt.Printf("Total.: %v\n", FormatMoney(total))
					fmt.Printf("Change: %v\n", FormatMoney(amount))
					total = 0

					time.Sleep(3 * time.Second)
					goto mainSection
				}
			}
		case "E": //exit
			fmt.Println("Are you sure you want to exit? (Y/N)")
			var exit string
			fmt.Scanln(&exit)
			if strings.ToUpper(exit) == "Y" {
				break mainSection
			} else {
				goto mainSection
			}
		default:
			fmt.Println("Unknown command")
		}
	}
}

type Fruit struct {
	name        string
	description string
	price       int64
	maxDiscount int
	stock       int
}

// converts int to a money formatted string (e.g 1000000 = $10.000,00)
func FormatMoney(money int64) string {
	var formattedString = strconv.Itoa(int(money))
	var dotn int = len(formattedString) - 2

	for i := 0; i < int(float64((dotn-1)/3)); i++ {
		formattedString = formattedString[:(i*4)+(dotn-1)%3+1] + "." + formattedString[(i*4+(dotn-1)%3+1):]
	}
	if dotn < 2 {
		formattedString = fmt.Sprintf("%03v", money)
	}
	formattedString = fmt.Sprint("$", formattedString[:len(formattedString)-2], ",", formattedString[len(formattedString)-2:])
	return formattedString
}
