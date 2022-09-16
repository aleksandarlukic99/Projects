import UIKit


struct Location {
    let x: Int
    let y: Int
}

let storeLocation = Location(x: 3, y: 4)

struct DeliveryArea {
    let center: Location
    var radius: Double
    
    func contains(location: Location) -> Bool {
        let distanceFromCenter = distance(from: Location(x: center.x, y: center.y), to: Location(x: location.x, y: location.y))
        return distanceFromCenter < radius
    }
    
    func overlaps(with area: DeliveryArea) -> Bool {
        distance(from: center, to: area.center) <= (radius + area.radius)
    }
}

var storeArea = DeliveryArea(center: storeLocation, radius: 2.5)

struct PizzaOrder {
    var toppings: [String]
    var size: Int
}
let pizza = PizzaOrder(toppings: ["Ketchup, Mayonaise, Ananas"], size: 44)

storeArea.radius
storeArea.center.y
storeArea.radius = 250

let fixedArea = DeliveryArea(center: storeLocation, radius: 4)

let areas = [
    DeliveryArea(center: Location(x: 3, y: 4), radius: 2.5),
    DeliveryArea(center: Location(x: 7, y: 8), radius: 1.5)
]

func isInDeliveryRange(location: Location) -> Bool {
    for area in areas {
        let distanceToStore = distance(from: Location(x: area.center.x, y: area.center.y), to: Location(x: location.x, y: location.y))
        
        if distanceToStore < area.radius {
            return true
        }
    }
    return false
}

let customerLocation1 = Location(x: 8, y: 1)
let customerLocation2 = Location(x: 5, y: 5)

isInDeliveryRange(location: customerLocation1)
isInDeliveryRange(location: customerLocation2)

func distance(from source: Location, to target: Location) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX + distanceY + distanceY).squareRoot()
}

//----------------------------------------------------------------
struct Fruit {
    var kind: String
    var weight: Int
}

let truck: [Fruit] = [
    Fruit(kind: "Pear", weight: Int.random(in: 50...100)),
    Fruit(kind: "Apple", weight: Int.random(in: 50...100)),
    Fruit(kind: "Orange", weight: Int.random(in: 50...100)),
    Fruit(kind: "Pear", weight: Int.random(in: 50...100)),
    Fruit(kind: "Pear", weight: Int.random(in: 50...100)),
    Fruit(kind: "Apple", weight: Int.random(in: 50...100)),
    Fruit(kind: "Orange", weight: Int.random(in: 50...100)),
    Fruit(kind: "Pear", weight: Int.random(in: 50...100)),
    Fruit(kind: "Apple", weight: Int.random(in: 50...100)),
    Fruit(kind: "Pear", weight: Int.random(in: 50...100))
]

var pears = [Fruit]()
var apples = [Fruit]()
var oranges = [Fruit]()

var totalWeight = 0

func sort(truck: [Fruit]) {
    for fruit in truck {
        switch fruit.kind {
        case "Pear":
            pears.append(fruit)
        case "Apple":
            apples.append(fruit)
        case "Orange":
            oranges.append(fruit)
        default:
            print("Wrong fruti")
        }
        totalWeight += fruit.weight
    }
}
sort(truck: truck)

print("Total weight: \(totalWeight)")
print("Number of: apples - \(apples.count), oranges - \(oranges.count) and pears - \(pears.count).")

//--------------------------------

struct Contact {
    var fullName: String
    var emailAddress: String
    var relationship = "Friend"
}

var person = Contact(fullName: "Aca Lukic", emailAddress: "acafineti@gmail.com")
person.fullName
person.emailAddress

person.fullName = "Aleksandar Lukic"
person.relationship = "Myself"

var boss = Contact(fullName: "Dejo", emailAddress: "dejan@icloud.com", relationship: "Boss")

struct TV {
    var height: Double
    var width: Double
    
    var diagonal: Int {
        get {
            let result = (height * height + width * width).squareRoot().rounded()
            return Int(result)
        }
        set {
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            
            let ratioDiagonal = (ratioWidth * ratioWidth + ratioHeight * ratioHeight).squareRoot()
            height = Double(newValue) * ratioHeight / ratioDiagonal
            width = height * ratioWidth / ratioHeight
        }
    }
}

var tv = TV(height: 53.93, width: 95.87)
tv.diagonal

tv.width = tv.height
tv.diagonal

tv.diagonal = 70
tv.height
tv.width

struct Level {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool {
        didSet {
            if unlocked && id > Self.highestLevel {
                Self.highestLevel = id
            }
        }
    }
}

let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)

struct LightBulb {
    static let maxCurrent = 40
    var isOn = false
    var current = LightBulb.maxCurrent {
        willSet {
            if newValue > Self.maxCurrent {
                print("Current is too high, turning off to prevent burn out.")
                isOn = false
            }
        }
        didSet {
            if current > Self.maxCurrent {
                print("Current is too high, falling back to previous setting.")
                current = oldValue
            }
        }
    }
}
// Installing a new bulb
var bulb = LightBulb() // Light bulb is off

// Flipping the switch
bulb.isOn = true // Light bulb is ON with 40 amps

// Using the dimmer
bulb.current = 30 // Light bulb is ON with 30 amps

// Using the dimmer to a high value
bulb.current = 50 // Light bulb is OFF

// Flipping the switch
bulb.isOn = true // Light bulb is ON with 30 amps

struct Circle {
    lazy var pi = {
        ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239/0)) * 4.0
    }()
    var radius = 0.0
    var circumference: Double {
        mutating get {
            pi * radius * 2
        }
    }
    init(radius: Double) {
        self.radius = radius
    }
}

var circle = Circle(radius: 5)
circle.circumference

struct Circle2 {
    var radius = 0.0
    var circumference: Double {
        .pi * radius * 2
    }
}
var circle2 = Circle2(radius: 5)
circle2.circumference

struct IceCream {
    let name: String = "Chokolady"
    lazy var ingredients: [String] = {
        ["Chocholate", "Strawsbery", "Vanilla"]
    }()
}
var icecream = IceCream()
icecream.ingredients
icecream.ingredients.append("Apple")

struct FuelTank {
    var lowFuel: Bool
    var level: Double {//decimal percentage between 0 and 1{
        didSet {
            if level <= 0 {
                level = 0
            } else if level > 1 {
                level = 1
            }
            lowFuel = level < 0.1
        }
    }
}

struct Car {
    let make: String
    let color: String
    var fuel: FuelTank
}

var car = Car(make: "Jugent", color: "Crni", fuel: FuelTank(lowFuel: false, level: 1))
car.fuel.level = -1
car.fuel.level = 2

//-------------------------------------------------------------\\

var numbers = [1, 2, 3]
numbers.removeLast()

let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

struct SimpleDate {
    var month: String = "January"
    var day: Int = 1
    
    var monthsUntilWinterBreak: Int {
        months.firstIndex(of: "December")! - months.firstIndex(of: month)!
    }
    
    mutating func advance() {
        day += 1
    }
}

let date = SimpleDate(month: "January", day: 1)
date.monthsUntilWinterBreak

let valentinesDay = SimpleDate(month: "February", day: 14)
valentinesDay.month
valentinesDay.day

let newYearsDay = SimpleDate()
newYearsDay.month
newYearsDay.day

let octoberFirst = SimpleDate(month: "October")
octoberFirst.day
octoberFirst.month

let januaryTwentySecond = SimpleDate(day: 22)
januaryTwentySecond.day
januaryTwentySecond.month


struct Math {
    static func factorial(of number: Int) -> Int {
        (1...number).reduce(1, *)
    }
    
    static func triangle(of number: Int) -> Int {
        (1...number).reduce(0, +)
    }
}
Math.factorial(of: 6)
Math.triangle(of: 10)

extension Math {
    static func primeFactors(of value: Int) -> [Int] {
        var remainingValue = value
        var testFactor = 2
        var primes: [Int] = []
        
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            }
            else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        return primes
    }
}
Math.primeFactors(of: 145)

extension SimpleDate {
    init(month: Int, day: Int) {
        self.month = months[month - 1]
        self.day = day
    }
}

var rodjendan = SimpleDate(month: "September", day: 24)
rodjendan.day
rodjendan.month
rodjendan.monthsUntilWinterBreak

struct Circle1 {
    var radius = 0.0
    var area: Double {
        .pi * radius * radius
    }
    
    func grow(byFactor: Int) -> Double {
        area * Double(byFactor)
    }
}

var newCircle = Circle1(radius: 5)
newCircle.grow(byFactor: 3)

struct SimpleDate1 {
    var month: String = "January"
    var day: Int = 1
    
    var monthsUntilWinterBreak: Int {
        months.firstIndex(of: "December")! - months.firstIndex(of: month)!
    }
    
    mutating func advance() {
        day += 1
        if day == 32 && month == "January" {
            day = 1
            month = "February"
        } else if day == 29 && month == "February" {
            day = 1
            month = "March"
        } else if day == 32 && month == "March" {
            day = 1
            month = "April"
        } else if day == 31 && month == "April" {
            day = 1
            month = "May"
        } else if day == 32 && month == "May" {
            day = 1
            month = "June"
        } else if day == 31 && month == "June" {
            day = 1
            month = "July"
        } else if day == 32 && month == "July" {
            day = 1
            month = "August"
        } else if day == 32 && month == "August" {
            day = 1
            month = "September"
        } else if day == 31 && month == "September" {
            day = 1
            month = "October"
        } else if day == 32 && month == "October" {
            day = 1
            month = "November"
        } else if day == 31 && month == "November" {
            day = 1
            month = "December"
        } else if day == 32 && month == "December" {
            day = 1
            month = "January"
        }
    }
}

var date1 = SimpleDate1(month: "December", day: 31)
date1.advance()
date1.month
date1.day

extension Math {
    static func isEven(number: Int) -> Bool {
        if number % 2 == 0 {
            return true
        }
        return false
    }
    
    static func isOdd(number: Int) -> Bool {
        if number % 2 == 1 {
            return true
        }
        return false
    }
}
Math.isEven(number: 5)
Math.isOdd(number: 5)

extension Int {
    var isEven: Bool {
        self % 2 == 0
    }
    var isOdd: Bool {
        self % 2 == 1
    }
}

5.isOdd
5.isEven

extension Int {
    func primeFactors() -> [Int] {
      var remainingValue = self
      var testFactor = 2
      var primes: [Int] = []
      while testFactor * testFactor <= remainingValue {
        if remainingValue % testFactor == 0 {
          primes.append(testFactor)
          remainingValue /= testFactor
        }
        else {
          testFactor += 1
        }
      }
      if remainingValue > 1 {
        primes.append(remainingValue)
      }
      return primes
    }
}

539.primeFactors()
