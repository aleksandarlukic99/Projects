import UIKit

var newArray = [6, 12, 92, 42]

func reverseArray(array: [Int]) -> [Int] {
    var newReversedArray = [Int]()
    for n in array {
        newReversedArray.insert(n, at: 0)
    }
    return newReversedArray
}
reverseArray(array: newArray)


//Hello World printing

print("Hello world!")

//Program that asks the user for their name and greets them with name

let name = "Aleksandar"

//Modify previous program that only greets Alice and Bob

if name == "Alice" || name == "Bob" {
    print("Greetings \(name)!")
} else {
    print("No greetings for \(name) 🤪")
}

//Write a program that prisnt sum 1...n

let number = 10
var i = 1
var sum = 0
while i <= number {
    sum += i
    i += 1
}
print(sum)

//Modify previous program that only multiplies of three nad five are consireded in sum

let num = 17
for n in 1...num {
    if n % 3 == 0 || n % 5 == 0 {
        sum += n
    }
}
print(sum)

//Program asks for number and give possibility to choose between computing sum or product 1...n

let n = 17
var wantSum = false
var wantProduct = true
var prod = 0
var summing = 0
var index = 1

while index <= n {
    if wantSum == true && wantProduct == false {
        summing += index
        index += 1
    } else {
       if wantProduct == true && wantSum == false {
        prod = index * index
        index += 1
       }
    }
}
print(summing)
print(prod)

//Write multiplication table

var lastNumber = 10

for i in 1...lastNumber {
    for j in 1...lastNumber {
        print("\(i) * \(j) = \(i * j)")
    }
}
   



//Func that cheeks if element is in array

func isElementInArray(in array: [Int], element: Int) -> Bool {
    for e in array {
        if e == element {
            return true
        }
    }
    return false
}

//Write a function that computes the runing total of the list
var array = [2, 9, 14]


func sumList(in array: [Int]) -> Int {
   var sumArray = 0
    for element in array {
       sumArray += element
    }
    return sumArray
}
sumList(in: array)



// Write a guessing game where the user has to guess a secret number. After every guess the program tells the user whether their number was too large or too small. At the end the number of tries needed should be printed. It counts only as one try if they input the same number multiple times consecutively.

let secretNumber = 14
var counter = 1

func guessTheNumber(_ number: Int, _ counter: Int) {
    var newCounter = counter
    if number == secretNumber {
        print("Pogodili ste broj iz \(counter) pokusaja")
    } else if number < secretNumber {
        print("Greska, broj koji se trazi je veci")
        newCounter += 1
        guessTheNumber(number, newCounter)
    } else if number > secretNumber {
        print("Greska, broj koji se trazi je manji")
        newCounter += 1
        guessTheNumber(number, newCounter)
    }
}
guessTheNumber(12, counter)


