import UIKit

struct Location {
    let x: Int
    let y: Int
}

func distance(from source: Location, to target: Location) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}

struct DeliveryArea {
    let center: Location
    let radius: Double
    
    func contains(location: Location) -> Bool {
        let distanceFromCenter = distance(from: center, to: location)
        
        return distanceFromCenter < radius
    }
    
    func overlaps(with area: DeliveryArea) -> Bool {
        distance(from: center, to: area.center) <= (radius + area.radius)
    }
}

let area1 = DeliveryArea(center: Location(x: 4, y: 3), radius: 2.2)
let area2 = DeliveryArea(center: Location(x: 2, y: 1), radius: 2)

area1.overlaps(with: area2)


/*
 Tree fruti farn
 */

struct Fruit {
    var kind: String
    var weight: Int
}

let truck: [Fruit] = [
    Fruit(kind: "Pear", weight: Int.random(in: 50...100)),
    Fruit(kind: "Orange", weight: Int.random(in: 50...100)),
    Fruit(kind: "Apple", weight: Int.random(in: 50...100)),
    Fruit(kind: "Pear", weight: Int.random(in: 50...100)),
    Fruit(kind: "Orange", weight: Int.random(in: 50...100)),
    Fruit(kind: "Pear", weight: Int.random(in: 50...100)),
    Fruit(kind: "Apple", weight: Int.random(in: 50...100))
]

var pears = [Fruit]()
var oranges = [Fruit]()
var apples = [Fruit]()

var totalWeight = 0

func sorting(truck: [Fruit]) {
    for fruit in truck {
        switch fruit.kind {
        case "Pear":
            pears.append(fruit)
        case "Apple":
            apples.append(fruit)
        case "Orange":
            oranges.append(fruit)
        default:
            print("Invalid fruit.")
        }
        totalWeight += fruit.weight
    }
}

sorting(truck: truck)

print("Total weight: \(totalWeight)")
print("Number of apples: \(apples.count)")
print("Number of pears: \(pears.count)")
print("Number of oranges: \(oranges.count)")

/*
 T shirt model
 */

typealias Color = String

typealias Size = String
let small: Size = "S"
let medium: Size = "M"
let large: Size = "L"
let extralarge: Size = "XL"

typealias Material = String
let wool: Material = "Wool"
let cotton: Material = "Cotton"
let polyester: Material = "Polyester"

struct Tshirt {
    let size: Size
    let material: Material
    let color: Color
    
    func cost() -> Double {
        
        let basePrice = 10.0
        
        let sizeMultiplier: Double
        
        switch size {
        case small, medium:
            sizeMultiplier = 1.0
        case large, extralarge:
            sizeMultiplier = 1.1
        default:
            sizeMultiplier = 1.2
        }
        
        let materialMultiplier: Double
        
        switch material {
        case polyester:
            materialMultiplier = 1.0
        case cotton:
            materialMultiplier = 1.1
        case wool:
            materialMultiplier = 1.2
        default:
            materialMultiplier = 1.3
        }
        
        return basePrice * sizeMultiplier * materialMultiplier
    }
}

Tshirt(size: extralarge, material: wool, color: "Blue").cost()

/*
 Battleships
 */

struct Coordinate {
    let x: Int
    let y: Int
}

struct Ship {
    let origin: Coordinate
    let direction: String
    let length: Int
    
    func isHit(coordinate: Coordinate) -> Bool {
        if direction == "Right" {
            return origin.y == coordinate.y && coordinate.x >= origin.x && coordinate.x - origin.x < length
        } else {
            return origin.x == coordinate.x && coordinate.y >= origin.y && coordinate.y - origin.y < length
        }
        
        
    }
}

struct Board {
    var ships = [Ship]()
    
    func fire(location: Coordinate) -> Bool {
        for ship in ships {
            if ship.isHit(coordinate: location) {
                print("Hit")
                return true
            }
        }
        return false
    }
}

let patrolBoat = Ship(origin: Coordinate(x: 2, y: 2), direction: "Right", length: 2)
let battleship = Ship(origin: Coordinate(x: 5, y: 3), direction: "Down", length: 4)
let submarine = Ship(origin: Coordinate(x: 0, y: 0), direction: "Down", length: 3)

var board = Board()

board.ships.append(contentsOf: [patrolBoat, battleship, submarine])

board.fire(location: Coordinate(x: 5, y: 3))
