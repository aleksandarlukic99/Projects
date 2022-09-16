import UIKit

/*
 Write a Swift program to compute the sum of the two integers. If the values are equal return the triple their sum.
 */

func sumOfIntegers(a: Int, b: Int) {
    if a == b {
        print("\(3 * (a + b))")
    } else {
        print("\(a + b)")
    }
}
sumOfIntegers(a: 5, b: 5)

/*
 Write a Swift program to compute and return the absolute difference of n and 51, if n is over 51 return double the absolute difference
 */

func absoluteDifference(number: Int) -> Int {
    if number > 51 {
        return 2 * (number - 51)
    } else {
        return 51 - number
    }
}
absoluteDifference(number: 55)

/*
 Write a Swift program that accept two integer values and return true if one of them is 20 or if their sum is 20
 */

func trueNumber(a: Int, b: Int) -> Bool {
    if a == 20 || b == 20 || a + b == 20 {
        return true
    }
    return false
}
trueNumber(a: 15, b: 5)

/*
 Write a Swift program to accept two integer values and return true if one is negative and one is positive. Return true only if both are negative.
 */

func trueNegatives(a: Int, b: Int) -> Bool {
    if a > 0 && b < 0 || a < 0 && b > 0 || a < 0 && b < 0 {
        return true
    }
    return false
}
trueNegatives(a: 2, b: -4)

/*
 Write a Swift program to add "Is" to the front of a given string. However, if the string already begins with "Is", return the given string.
 */

func isString(string: String) -> String {
    if string.hasPrefix("Is") {
        return string
    } else {
        return "Is \(string)"
    }
}
isString(string: "Swift")

/*
 Write a Swift program to remove a character at specified index of a given non-empty string. The value of the specified index will be in the range 0..str.length()-1 inclusive.
 */

func removeCharacter(string: String, removeAt: Int) {
    let count = string.count
    var newString = string
    let remove = string.index(string.startIndex, offsetBy: removeAt)
    if count > 0 {
        newString.remove(at: remove)
    }
}
removeCharacter(string: "Idemo napolje, napolju je najbolje", removeAt: 7)

/*
 Write a Swift program to change the first and last character of a given string.
 */

func changeCharacters(string: String) {
    var newString = string
    let firstCharacter = newString.remove(at: newString.startIndex)
    let lastCharacterIndex = newString.index(before: newString.endIndex)
    let lastCharacter = newString.remove(at: lastCharacterIndex)
    
    newString.append(firstCharacter)
    newString.insert(lastCharacter, at: newString.startIndex)
}
changeCharacters(string: "Konj")

/*
 Write a Swift program to add the last character (given string) at the front and back of a given string. The length of the given string must be 1 or more
 */

func lastCharacter(string: String) {
    let count = string.count
    
    if count >= 1 {
        var newString = string
        let lastCharacterIndex = newString.index(before: newString.endIndex)
        let lastCharacter = newString.remove(at: lastCharacterIndex)
        
        newString.append(lastCharacter)
        newString.insert(lastCharacter, at: newString.startIndex)
        
    }
}
lastCharacter(string: "Konj")

/*
 Write a Swift program to check if a given non-negative number is a multiple of 3 or a multiple of 5.
 */

func multipleOf3or5(number: Int) {
    
    if number % 3 == 0 && number % 5 == 0 {
        print("Number is multiple of 5 and 3")
    } else if number % 3 == 0 {
        print("Number is multiple of 3")
    } else if number % 5 == 0 {
        print("Number is multiple of 5")
    }
}
multipleOf3or5(number: 15)

/*
 Write a Swift program to take the first two characters from a given string and create a new string with the two characters added at both the front and back.
 */

func addTwoCharacters(string: String) -> String {
    let newString = string
    let firstTwoValues = newString.prefix(2)
    let firstTwo = String(firstTwoValues)
    return firstTwo + string + firstTwo
}
addTwoCharacters(string: "Aca")

/*
 Write a Swift program to test a given string whether it starts with "Is". Return true or false.
 */

func trueOrFalseIs(string: String) -> Bool {
    if string.prefix(2) == "Is" {
        return true
    }
    return false
}
trueOrFalseIs(string: "Is noob")

/*
 Write a Swift program that return true if either of two given integers is in the range 10..30 inclusive.
 */

func trueOrFalseInteger(number: Int) -> Bool {
    switch number {
    case 10...30:
        return true
    default:
        return false
    }
}
trueOrFalseInteger(number: 5)

/*
 Write a Swift program to check if a given string begins with "fix", except the 'f' can be any character or number.
 */

func startFix(string: String) -> Bool {
    var newString = string
    let startIndex = newString.startIndex
    let firstCharacter = newString.remove(at: startIndex)
    
    if newString.hasPrefix("ix") == true {
        newString.removeFirst(3)
        newString.insert(firstCharacter, at: startIndex)
        return true
    }
    return false
}
startFix(string: "fix car")

/*
 Write a Swift program to find the largest number among three given integers
 */

func biggestNumber(a: Int, b: Int, c: Int) {
    if a > b && a > c {
        print("Biggest numbert is \(a)")
    } else if b > a && b > c {
        print("Biggest numbert is \(b)")
    } else if c > a && c > b {
        print("Biggest numbert is \(c)")
    }
}
biggestNumber(a: 5, b: 9, c: 12)

/*
 Write a Swift program that accept two integer values and to test which value is nearest to the value 10, or return 0 if both integers have same distance from 10.
 */

func closestToTen(a: Int, b: Int) {
    if a == b {
        print("0")
    } else if 10 - a < 10 - b {
        print("\(a) is closer to 10")
    } else if 10 - a > 10 - b {
        print("\(b) is closer to 10")
    }
}
closestToTen(a: 6, b: 6)

/*
 Write a Swift program that accept two integer values and test if they are both in the range 20..30 inclusive, or they are both in the range 30..40 inclusive.
 */

func isInRange (a: Int, b: Int) -> Bool {
    switch (a, b) {
    case _ where a >= 20 && a <= 30  && b >= 30 && b <= 40:
        return true
    case _ where a >= 30 && a <= 40  && b >= 30 && b <= 40:
        return true
    default:
        return false
    }
}
isInRange(a: 20, b: 41)

/*
 Write a Swift program that accept two positive integer values and test whether the larger value is in the range 20..30 inclusive, or return 0 if neither is in that range.
 */

func largerNumber(a: Int, b: Int) -> Int {
    if a >= 20 && a <= 30 && b >= 20 && b <= 30 {
        if a > b {
            return a
        } else {
            return b
        }
    }
    return 0
}
largerNumber(a: 30, b: 25)

