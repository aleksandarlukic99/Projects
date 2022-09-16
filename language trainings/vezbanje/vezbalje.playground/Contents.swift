import UIKit

var players = ["Alice", "Bob", "Cindy", "Dan" ]

var currentPlayer = players.min()
if let currentPlayer = currentPlayer {
    print("\(currentPlayer) will start")
}

var firstPlayer = players[0]
print("First player is \(firstPlayer)")

let playersSlice = players[1...2]
print(playersSlice[1], playersSlice[2])

let playerArray = Array(players[1...2])
print(playerArray[0], playerArray[1])

func isEliminated(player: String) -> Bool {
    !players.contains(player)
}
print(isEliminated(player: "Bob"))

players[1...3].contains("Bob")

players.append("Eli")
players += ["Gina"]

print(players)

players.insert("Frank", at: 5)
print(players)

var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed")

removedPlayer = players.remove(at: 2)
print("\(removedPlayer) was removed")

players.firstIndex(of: "Dan")
print(players)
players[4] = "Franklin"
print(players)

players[0...1] = ["Dona", "Craig", "Brian", "Anna"]
print(players)

let playerAnna = players.remove(at: 3)
players.insert(playerAnna, at: 0)
print(players)

players.sort()


let scores = [2, 2, 8, 6, 1, 2, 1]

for player in players {
    print(player)
}
for (index, player) in players.enumerated() {
    print("\(index + 1). \(player)")
}

func sumOfElements(in array: [Int]) -> Int {
    var sum = 0
    for number in array {
        sum += number
    }
    return sum
}
print(sumOfElements(in: scores))

for (index, player) in players.enumerated() {
    print("\(index + 1). \(player) - \(scores[index])")
}
