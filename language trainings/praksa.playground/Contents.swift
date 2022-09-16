import UIKit

var array = ["konj", "krava", "svinja", "slon", "oktopod", "ptica"]
var name = ""

for animal in array {
    if name.count <  animal.count {
        name = animal
    }
}
print(name)



var array1 = [1, 2, 3, 4]
var index22 = array1.count - 1

func stringBack(_ array: [Int], index: Int) {
    print(array[index])
    if index > 0 {
        stringBack(array, index: index - 1)
    }
}
stringBack(array1, index: index22)



var someArray = [5, 9, 14, 22, 6]


func newArray(_ array: [Int]) -> [Int] {
    var someNewArray: [Int] = []
    for i in 0..<array.count{
        someNewArray[i] = array[i]
    }
    return someNewArray
}


var someArray1 = [13, 12, 4, 9, 11]

func connectingArrays(_ array: [Int], with array2: [Int]) -> [Int] {
    var connectedArray = array
    for i in 0..<array.count {
        connectedArray.append(array2[i])
    }
    return connectedArray
}
connectingArrays(someArray, with: someArray1)



var bigArray = [1,2,3,4,5,6,7,8,9,10]
var bigArray2 = [11,12,13,14,15,16,17,18,19,20]


func orderdingArrays(_ array1: [Int], and array2: [Int]) -> [Int] {
    var newOrderingArray: [Int] = []
    for i in 0..<array1.count {
        newOrderingArray.append(array1[i])
        newOrderingArray.insert(array2[i], at: 0)
    }
    
    return newOrderingArray
}
orderdingArrays(bigArray, and: bigArray2)


func orderdingArrays2(_ array1: [Int], and array2: [Int]) -> [Int] {
    var newOrderingArray: [Int] = []
    var i = 0
    while i < array1.count {
        newOrderingArray.insert(array1[i], at: 0)
        newOrderingArray.insert(array2[array2.count - 1 - i], at: 0)
        i += 1
}
    return newOrderingArray
}
orderdingArrays2(bigArray2, and: bigArray)


func check(if number: Int, exsistsIn array: [Int]) -> Bool {
    for element in array {
        if number == element {
            return true
        }
    }
    return false
}

var arrayDuplicate = [5, 9, 1, 4, 4, 2, 4]

func removeDuplicate(array: [Int]) -> [Int] {
    var duplicatesFreeArray = [Int]()
    for number in array {
        if check(if: number, exsistsIn: duplicatesFreeArray) == false {
            duplicatesFreeArray.append(number)
        } else {
            print("number: \(number) is duplicate")
        }
    }
    return duplicatesFreeArray
}
removeDuplicate(array: arrayDuplicate)


