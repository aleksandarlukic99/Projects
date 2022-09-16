import UIKit

var namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores)

var pair: [String: Int] = [:]

pair.reserveCapacity(20)

print(namesAndScores["Anna"]!)

namesAndScores["Greg"]

var bobData = [
    "name": "Bob",
    "profession": "Card player",
    "country": "USA"
]
bobData.updateValue("CA", forKey: "state")
bobData["city"] = "San Francisco"


func printLocation(ofPlayer player: [String: String]) {
    if let state = player["state"], let city = player["city"] {
        print("Player lives in \(state) in \(city)")
    }
}

bobData.updateValue("Bobby", forKey: "name")
bobData["profession"] = "Mailman"

bobData.removeValue(forKey: "state")
bobData["city"] = nil

for (player, score) in namesAndScores {
    print("\(player) - \(score)")
}

for player in namesAndScores.keys {
    print("\(player), ", terminator: "")
}
print("")


let setOne: Set<Int> = [1]

let someArray = [1, 2, 3, 1]
var explicitSet: Set<Int> = [1, 2, 3, 1]
var someSet = Set([1, 2, 3, 1])
print(someSet)

print(someSet.contains(1))

someSet.insert(5)
let removedElemet = someSet.remove(1)



var array = ["konj", "krava", "zirafa", "ptica"]
var name = ""

for animal in array {
    if name.count < animal.count  {
        name = animal
}
}
print(name)
