import UIKit


//Find minimum and maximum

let numbers = [1, 4, 23, 9, 11]

func minMax(of numbers: [Int]) -> (max: Int, min: Int)? {
    if numbers.isEmpty {
        return nil
    }
    var numberMax = 0
    var numberMin = numbers[0]
    for n in numbers {
        if numberMax < n {
            numberMax = n
        } else if numberMin > n {
            numberMin = n
        }
    }
    return (numberMax, numberMin)
}
minMax(of: numbers)

//Remove the first number

var arrayInt = [9, 3, 22, 97, 85, 3]

func removingOnce(_ item: Int, from array: [Int]) -> [Int] {
    var newArray = array
    if let index = array.firstIndex(of: item) {
        newArray.remove(at: index)
    }
    return newArray
}
removingOnce(3, from: arrayInt)

//Reverse an array

var reverseArray = [2, 5, 9, 12]

func reversed(_ array: [Int]) -> [Int] {
    var newReverseArray: [Int] = []
        for i in array {
            newReverseArray.insert(i, at: 0)
    }
    return newReverseArray
}
reversed(reverseArray)

//Remove the number

var arrayRemoving = [9, 12, 14, 9, 99, 6]

func removing(_ item: Int, from array: [Int]) -> [Int] {
    var newArray: [Int] = []
    for number in array {
        if number != item {
            newArray.append(number)
        }
    }
    return newArray
}
removing(9, from: arrayRemoving)

//Return the middle

var arrayMiddle = [12, 14, 22, 84, 89, 82]

func middle(_ array: [Int]) -> Int? {
    if array.isEmpty {
        return nil
    }
    let lenght = array.count
    if lenght % 2 == 0 {
        let middle = (lenght / 2) - 1
        return array[middle]
    } else if lenght % 2 == 1 {
        let middle = lenght / 2
        return array[middle]
    }
    return nil
}
middle(arrayMiddle)

//Long names
var states = ["NY": "New york", "CA": "California", "SA": "Sabac", "NB": "Novi Beograd"]

func printLongNames(in dictionary: [String: String]) {
    for (_, value) in dictionary {
        if value.count > 8 {
            print(value)
        }
    }
}
printLongNames(in: states)

//Mergin dictionaries

var states2 = ["OB": "Obrenovac", "AL": "Aleksinac", "CA": "California"]

func merging(_ dict1: [String: String], with dict2: [String: String]) -> [String: String] {
    var newState = dict1
    for (key, value) in dict2 {
        newState[key] = value
    }
    return newState
}
merging(states, with: states2)

//Count characters

var string = "Slon dondolan i slonica mica"

func occurrencesOfCharacters(in text: String) -> [Character: Int] {
    var occurrences: [Character: Int] = [:]
    for char in text {
        if let count = occurrences[char] {
            occurrences[char] = count + 1
        } else {
            occurrences[char] = 1
        }
    }
    return occurrences
}
occurrencesOfCharacters(in: string)

//pokusaj drugim nacinom

func occurrencesOfCharacters1(in text: String) -> [Character: Int] {
    var occurrences: [Character: Int] = [:]
    for char in text {
        occurrences[char, default: 0] += 1
    }
    return occurrences
}
occurrencesOfCharacters1(in: string)


//Removing keys

var nameTitleLookup: [String: String?] = ["Mary": "Engineer", "Patrick": "Intern", "Ray": "Hacker"]
nameTitleLookup.updateValue(nil, forKey: "Patrick")
nameTitleLookup["Ray"] = nil
print(nameTitleLookup)
