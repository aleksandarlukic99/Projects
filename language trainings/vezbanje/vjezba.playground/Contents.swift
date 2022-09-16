import UIKit

var arrayRemove = [6, 9, 2, 7, 9]

func removingOnce(_ item: Int, from array: [Int]) -> [Int] {
    var newArray = array
    if let index = newArray.firstIndex(of: item) {
        newArray.remove(at: index)
    }
    return newArray
}
removingOnce(9, from: arrayRemove)

//removing number

var arrayRemove1 = [32, 43, 55, 1, 9, 16, 32]

func removing(_ item: Int, from array: [Int]) -> [Int] {
    var newArray: [Int] = []
    for number in array {
        if number != item {
            newArray.append(number)
        }
    }
    return newArray
}
removing(32, from: arrayRemove1)

//reverse array

var arrayReversed = [5, 3, 4, 9, 11]

func reversed(_ array: [Int]) -> [Int] {
    var newArray: [Int] = []
    for numbers in array {
        newArray.insert(numbers, at: 0)
    }
    return newArray
}
reversed(arrayReversed)

//Return the middle

var arrayMiddle = [11, 452, 99, 02, 4, 12]

func middle(_ array: [Int]) -> Int? {
    let lenght = array.count
    if lenght % 2 == 0 {
        let middle = lenght / 2 - 1
        return array[middle]
    } else if lenght % 2 != 0 {
        let middle = lenght / 2
        return array[middle]
    }
    return nil
}
middle(arrayMiddle)

//find minimum and maximum

var minMaxNumber = [14, 9, 84, 8, 72, 17]

func minMax(of numbers: [Int]) -> (min: Int, max: Int) {
    var min = numbers[0]
    var max = 0
    for number in numbers{
        if max < number {
            max = number
        } else if min > number {
            min = number
        }
    }
    return(min, max)
}
minMax(of: minMaxNumber)

//Long names

var dictionary = ["NY": "New york", "WA": "Washington", "MW": "Milwaukee"]

func longStateNames(in dictionary: [String:String]) {
    for(_, value) in dictionary {
        if value.count > 8 {
            print(value)
        }
    }
}
longStateNames(in: dictionary)

//Merging
var dictionary2 = ["SA": "Sabac"]

func merging(_ dict1: [String: String], with dict2: [String: String]) -> [String: String] {
    var newDict = dict1
    for (key, value) in dict2 {
        newDict[key] = value
    }
    return newDict
}
merging(dictionary, with: dictionary2)

//count the characters

var stringOne = "Ja volim da jedem hamburger"

func occurrencesOffCharacters(in text: String) -> [Character: Int] {
    var occurrences: [Character: Int] = [:]
    for char in text {
        occurrences[char, default: 0] += 1
    }
    return occurrences
}
occurrencesOffCharacters(in: stringOne)

//reverse string
var stringo = "Ja sam Aca"

func reversedStringo(string: String) -> (String) {
    var newString = ""
    for char in string {
        newString.insert(char, at: String.Index(encodedOffset: 0))
    }
    return newString
}
reversedStringo(string: stringo)



