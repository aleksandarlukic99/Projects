import UIKit

/*
 “Imagine you’re at a fruit tree farm and you grow different kinds of fruits: pears, apples, and oranges. After the fruits are picked, a truck brings them in to be processed at the central facility. Since the fruits are all mixed together on the truck, the workers in the central facility have to sort them into the correct inventory container one-by-one.
 Implement an algorithm that receives a truck full of different kinds of fruits and places each fruit into the correct inventory container.
 Keep track of the total weight of fruit processed by the facility and print out how many of each fruit are in the inventory.”
 */


struct Fruit {
    let kind: String
    let weight: Int
}

let truck = [
    Fruit(kind: "Apple", weight: Int.random(in: 50...100)),
    Fruit(kind: "Banana", weight: Int.random(in: 50...100)),
    Fruit(kind: "Orange", weight: Int.random(in: 50...100)),
    Fruit(kind: "Apple", weight: Int.random(in: 50...100)),
    Fruit(kind: "Apple", weight: Int.random(in: 50...100)),
    Fruit(kind: "Banana", weight: Int.random(in: 50...100))
]
var apples = [Fruit]()
var bananas = [Fruit]()
var oranges = [Fruit]()

var totalWeight = 0

func sortingFruits(truck: [Fruit]) {
    for fruit in truck {
        switch fruit.kind {
        case "Apple":
            apples.append(fruit)
        case "Orange":
            oranges.append(fruit)
        case "Banana":
            bananas.append(fruit)
        default:
            print("WRONG")
        }
        totalWeight += fruit.weight
    }
}
sortingFruits(truck: truck)


print("Total weight: \(totalWeight)")
print("Total apples: \(apples.count), bananas: \(bananas.count), oranges: \(oranges.count)")

/*
 “Create a T-shirt structure that has size, color and material options. Provide a method to calculate the cost of a shirt based on its attributes.”
 */

typealias size = String
let small: size = "S"
let medium: size = "M"
let large: size = "L"

typealias color = String

typealias material = String
let wool: material = "wool"
let polyester: material = "polyester"
let cotton: material = "cotton"

struct Tshirt {
    let size: size
    let color: color
    let material: material
    
    func cost() -> Double {
        
        let baseCost = 10.0
        var sizeMultipler: Double = 0
        
        switch size {
        case small:
            sizeMultipler = 1.0
        case medium:
            sizeMultipler = 1.1
        case large:
            sizeMultipler = 1.2
        default:
            sizeMultipler = 1.5
        }
        
        var materialMultipler: Double = 0
        
        switch material {
        case polyester:
            materialMultipler = 1.0
        case cotton:
            materialMultipler = 1.2
        case wool:
            materialMultipler = 1.5
        default:
            materialMultipler = 2.0
        }
        
        return materialMultipler * sizeMultipler * baseCost
    }
}

Tshirt(size: large, color: "Blue", material: wool).cost()

/*
 “Write the engine for a Battleship-like game. If you aren’t familiar with Battleship, see here: http://bit.ly/2nT3JBU
 Use an (x, y) coordinate system for your locations modeled using a structure.
 Ships should also be modeled with structures. Record an origin, direction and length.
 Each ship should be able to report if a “shot” has resulted in a “hit”.”
 */

struct Location {
    let x: Int
    let y: Int
}

struct Ship {
    let origin: Location
    let direction: String
    let lenght: Int
    
    func isHit(location: Location) -> Bool {
        if direction == "right" {
            return origin.y == location.y && location.x >= origin.x && location.x - origin.x < lenght
        } else {
            return origin.x == location.x && location.y >= origin.y && location.y - origin.y < lenght
        }
    }
}

struct Board {
    var ships: [Ship] = []
    
    func fire(location: Location) -> Bool {
        for ship in ships {
            if ship.isHit(location: location) {
                print("Hit!")
                return true
            }
        }
        return false
    }
}

let patrolBoat = Ship(origin: Location(x: 5, y: 3), direction: "down", lenght: 2)
let battleShip = Ship(origin: Location(x: 2, y: 2), direction: "down", lenght: 4)
let submarine = Ship(origin: Location(x: 9, y: 5), direction: "right", lenght: 3)

var board = Board()
board.ships.append(contentsOf: [patrolBoat, battleShip, submarine])
board.fire(location: Location(x: 9, y: 5))
