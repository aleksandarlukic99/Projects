import UIKit

let restaurantLocation = (3, 4)
let restaurantRange = 2.5

let otherRestaurantLocation = (7, 8)
let otherRestaurantRange = 1.5

//Pitagorina teorema:
func distance(from source: (x: Int, y: Int), to target: (x: Int, y: Int)) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}

func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
    let deliveryDistance = distance(from: location, to: restaurantLocation)
    
    let secondDeliveryDistance = distance(from: location, to: otherRestaurantLocation)
    
    return deliveryDistance < restaurantRange || secondDeliveryDistance < otherRestaurantRange
}

isInDeliveryRange(location: (x: 5, y: 5))

struct Location {
    let x: Int
    let y: Int
}

let storeLocation = Location(x: 3, y: 4)

struct DeliveryArea {
    let center: Location
    var radius: Double
    
    func contains(location: Location) -> Bool {
        let distanceFromCenter = distance(from: (center.x, center.y), to: (location.x, location.y))
        
        return distanceFromCenter < radius
    }
}

var storeArea = DeliveryArea(center: storeLocation, radius: 2.5)

struct Pizza {
    let toppings: [String]
    let size: Int
}

Pizza(toppings: ["Ketchup", "Mayo"], size: 34)

print(storeArea.radius)
print(storeArea.center.x)
storeArea.radius = 250

var fixedArea = DeliveryArea(center: storeLocation, radius: 2.5)
fixedArea.radius = 250

let areas = [
    DeliveryArea(center: Location(x: 3, y: 4), radius: 2.5),
    DeliveryArea(center: Location(x: 7, y: 8), radius: 1.5)
]

func canBeDeliveredInRange(location: Location) -> Bool {
    for area in areas {
        let distanceToStore = distance(from: (area.center.x, area.center.y), to: (location.x, location.y))
        
        if distanceToStore < area.radius {
            return true
        }
    }
    return false
}

let customerLocation1 = Location(x: 8, y: 1)
let customerLocation2 = Location(x: 5, y: 5)

print(canBeDeliveredInRange(location: customerLocation1))
print(canBeDeliveredInRange(location: customerLocation2))

let area = DeliveryArea(center: Location(x: 3, y: 4), radius: 2.5)
let customerLocation = Location(x: 5, y: 5)
area.contains(location: customerLocation)
