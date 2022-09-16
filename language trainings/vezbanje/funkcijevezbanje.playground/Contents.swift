import UIKit

func add(_ a: Int, _ b: Int) -> Int {
    a + b
}
var function = add
function(4,2)

func sub(_ a: Int, _ b: Int) -> Int {
    a - b
}
function = sub
sub(4,2)

func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}
printResult(sub, 4, 2)

//Stride

for i in stride(from: 10.0, through: 9.0, by: -0.1) {
    print(i)
}

func isNumberDivisible(_ number: Int, by divisor: Int) -> Bool {
    number % divisor == 0
}
    func isPrime(_ number: Int) -> Bool {
        if number < 0 {
            return false
        } else if number <= 3 {
            return true
        }
        let doubleNumber = Double(number)
        let root = Int(doubleNumber.squareRoot())
        for divisor in 2...root {
            if isNumberDivisible(number, by: divisor) {
                return false
            }
            
        }
        return true
    }

isPrime(6)
isPrime(13)
isPrime(8893)

func fibonacci(_ number: Int) -> Int {
    if number < 0 {
        return 0
    } else if number == 1 || number == 2 {
        return 1
    }
    return fibonacci(number - 1) + fibonacci(number - 2)
}
fibonacci(7)


// mini exercises

var myFavoriteSong: String? = nil
let parsedInt = Int("dog")

if let myFavoriteSong = myFavoriteSong {
    print("My favorite song is \(myFavoriteSong)")
    } else {
        print("I dont have favorite song")
    }

func calculateNumberOfSides(shape: String) -> Int? {
    switch shape {
    case "Triangle":
        return 3
    case "Square":
        return 4
    case "Pentagon":
        return 5
    default:
        return nil
    }
}

func maybePrintSides(shape: String) {
    guard let sides = calculateNumberOfSides(shape: shape) else {
        print("Idk the number sides for \(shape).")
        return
    }
    print("A \(shape) has \(sides) sides")
}
maybePrintSides(shape: "Square")

//Challenges

func divideIfWhole(_ value: Int, by divisor: Int) -> Int? {
    if value % divisor == 0 {
        return value / divisor
    } else {
        return nil
    }
}
if let answer = divideIfWhole(10, by: 2) {
    print("divide \(answer) times")
} else {
    print("Not divisivble")
}

let answer1 = divideIfWhole(10, by: 2) ?? 0
print("Divisible  \(answer1) times.")



let number: Int??? = 10
print(number!!!)

if let number = number {
   if let number = number {
      if let number = number {
            print(number)
    }
}
}

if let n1 = number,
  let n2 = n1,
  let n3 = n2 {
    print(n3)
}

func printNumber(_ number: Int???) {
    guard let n1 = number, let n2 = n1, let n3 = n2 else {
        return
    }
    print(n3)
}
printNumber(number)

