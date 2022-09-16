import UIKit

let myFavoriteSong: String? = nil
let parsedInt = Int("doggie")



var authorName: String? = "Matt Galloway"
var authorAge: Int? = 30


if let authorName = authorName,
    let authorAge = authorAge,
    authorAge >= 40 {
    print("Author is \(authorName) who is \(authorAge) yo.")
} else {
    print("No author or no age or age less than 40.")
}

if let myFavoriteSong = myFavoriteSong {
    print("My fave song is \(myFavoriteSong)")
} else {
    print("I dont have fave song")
}

func guardMyCastle(name: String?) {
    guard let castleName = name else {
        print("No castle!")
        return
    }
    print("You castle \(castleName) was guarded")
}
guardMyCastle(name: nil)


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
    case "Hexahon":
        return 6
    default:
        return nil
    }
}

func maybePrintSides(shape: String) {
    guard let sides = calculateNumberOfSides(shape: shape) else {
        print("I dont know number of sides for \(shape)")
        return
    }
    print ("A \(shape) has \(sides) sides")
}
maybePrintSides(shape: "coc")

var optionalInt: Int? = 10
var mustHaveResult = optionalInt ?? 0
if let unwrapped = optionalInt {
    mustHaveResult = unwrapped
} else {
    mustHaveResult = 0
}

//----------------------------------------------------------

func divideIfWhole(_ value: Int, by divisor: Int) -> Int? {
    if value % divisor == 0 {
        return value / divisor
    } else {
        return nil
    }
}
if let answer = divideIfWhole(10, by: 5) {
    print("It divides \(answer) times")
} else {
    print("nope")
}

let answer1 = divideIfWhole(10, by: 3) ?? 0
print("It divides \(answer1) times")

//-------------------------------------------------------

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


