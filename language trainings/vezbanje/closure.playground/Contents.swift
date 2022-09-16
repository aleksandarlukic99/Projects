import UIKit

let names = ["Nikola", "Aca", "Dejan", "Sinisa"]
let reduceNames = names.reduce("") { (a,b) in
    a + b
}

let filteredNames = names.filter {
    $0.count > 4
}


let namesAndAges = ["Nikola": 24, "Sinisa": 17, "Dejan": 31, "Aleksandar": 21]
let underaged = namesAndAges.filter {
    $0.value < 18
}

let adults = namesAndAges.filter {
    $0.value > 18
}.map {
    $0.key
}

//------------------------------------------

func repeatTask(times: Int, task: () -> Void) {
    for _ in 1...times {
        task()
    }
}
repeatTask(times: 10) {
    print("Swift Apprentice is a great book.")
}

//--------------------------------------------

func mathSum(lenght: Int, series: (Int) -> Int) -> Int {
    var sum = 0
    for i in 1...lenght {
        sum += series(i)
    }
    return sum
}

mathSum(lenght: 10) {
    $0 * $0
}

func fibonacci(_ number: Int) -> Int {
   if number == 0 {
    return 0
   }
    if number == 1 || number == 2 {
        return 1
    }
    return fibonacci(number - 1) + fibonacci(number - 2)
}

mathSum(lenght: 10, series: fibonacci)

//--------------------------------------

let appRatings = [
    "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
    "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
    "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]
]

var averageRatings: [String: Double] = [:]
appRatings.forEach {
    let total = $0.value.reduce(0, +)
    averageRatings[$0.key] = Double(total) / Double($0.value.count)
}
averageRatings

averageRatings.filter {
    $0.value > 3
}.map {
    $0.key
}
