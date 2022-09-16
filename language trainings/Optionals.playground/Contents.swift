import UIKit

//MARK: - Optionals

var errorCode: Int?
errorCode = 100
errorCode = nil

//MARK: - Mini exercises

//1. Make an optional String called myFavoriteSong. If you have a favorite song, set it to a string representing that song. If you have more than one favorite song or no favorite, set the optional to nil.

var myFavoriteSong: String? = nil

//2, 3

let parsedInt = Int("dog")

//MARK: - Unwrapping optionals

var result: Int? = 193
print(result! + 9)

//Force unwrapping

var authorName: String? = "Matt Galloway"
var authorAge: Int? = 30

var unwrappedName = authorName!
print("Author is \(unwrappedName)")

//print("Author name is \(authorName!)")

if authorName != nil {
    print("Author name is \(authorName!)")
} else {
    print("No author")
}

//Optional binding

if let authorName = authorName,
let authorAge = authorAge,
authorAge >= 40 {
    print("Author is \(authorName) and have \(authorAge) years.")
} else {
    print("No author or no age or age less than 40 years")
}

//MARK: - Mini exercises

//1, 2
myFavoriteSong = "OH SH*T\nI AM FEELING IT"
if let myFavoriteSong = myFavoriteSong {
    print("My favorite song is \(myFavoriteSong)")
} else {
    print("I dont have a favorite song")
}

//MARK: - Introducing guard

func guardMyCastle(name: String?) {
    guard let castleName = name else {
        print("No castle!")
        return
    }
    
    print("Your castle called \(castleName) was guarded!")
}

guardMyCastle(name: "Kanta")

func calculateNumberOfSides(shape: String) -> Int? {
    switch shape {
    case "Triangle":
        return 3
    case "Square":
        return 4
    case "Rectangle":
        return 4
    case "Pentagon":
        return 5
    default:
        return nil
    }
}

func maybePrintSides(shape: String) {
    guard let sides = calculateNumberOfSides(shape: shape) else {
        print("I don't know the numbers of sides for \(shape)")
        return
    }
    
    print("A \(shape) has \(sides) sides")
}
maybePrintSides(shape: "Triangle")

//MARK: Nil coalescing -

var optionalNil: Int? = 10
var mustHaveResults = optionalNil ?? 0

//same as:

var optionalInt: Int? = 24
var mustHaveResult: Int
if let unwrapped = optionalInt {
    mustHaveResult = unwrapped
} else {
    mustHaveResult = 0
}

//MARK: - Challenges

//1

var name: String? = "Aca"
var middleName: String? = nil

//2

func divideIfWhole(_ value: Int, by divisor: Int) -> Int? {
    if value % divisor == 0 {
        return value / divisor
    } else {
        return nil
    }
}

let isDivisible = divideIfWhole(10, by: 2) ?? nil
if let answer = isDivisible {
    print("Its divisible \(answer) times")
} else {
    print("Not divisible")
}


//3

var answer1 = divideIfWhole(10, by: 2) ?? 0
print(answer1)

//4

let number: Int??? = 10

print(number!!!)

if let number1 = number,
   let number2 = number1,
   let number3 = number2 {
    print(number3)
}

func printNumber(_ number: Int???) {
    guard let number1 = number, let number2 = number1, let number3 = number2 else {
        return
    }
    print(number3)
}
