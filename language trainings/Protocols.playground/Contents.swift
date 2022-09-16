import UIKit

protocol Vehicle {
    func accelerate()
    func stop()
}

class Unicycle: Vehicle {
    var peddling = false
    
    func accelerate() {
        peddling = true
    }
    
    func stop() {
        peddling = false
    }
    
}

enum Direction {
    case left
    case right
}

protocol DirectionalVehicle {
    func accelerate()
    func stop()
    func turn(_ direction: Direction)
    func description() -> String
}

protocol OptionalDirectionVehicle {
    func turn()
    func turn(_ direction: Direction)
}

protocol VehicleProperties {
    var weight: Int { get }
    var name: String { get set }
}

protocol Account {
    var value: Double { get set }
    init(initialAmount: Double)
    init?(transferAccount: Account)
}

class BitcoinAccount: Account {
    var value: Double
    
    required init(initialAmount: Double) {
        value = initialAmount
    }
    
    required init?(transferAccount: Account) {
        guard transferAccount.value > 0.0 else {
            return nil
        }
        value = transferAccount.value
    }
}

var accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 30.00)
let transferAccount = accountType.init(transferAccount: account)!

protocol WheeledVehicle: Vehicle {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}

/*class Bike: Vehicle {
    
    var peddling = false
    var brakesApplied = false
    
    func accelerate() {
        peddling = true
        brakesApplied = false
    }
    
    func stop() {
        peddling = false
        brakesApplied = true
    }
}
*/

class Bike: WheeledVehicle {
    
    let numberOfWheels: Int = 2
    var wheelSize: Double = 16.0
    
    var peddling = false
    var brakesApplied = false
    
    func accelerate() {
        peddling = true
        brakesApplied = false
    }
    
    func stop() {
        peddling = false
        brakesApplied = true
    }
    
}

protocol WeightCalculatable {
    associatedtype WeightType
    var weight: WeightType { get }
}

class HeavyThing: WeightCalculatable {
    typealias WeightType = Int
    
    var weight: Int { 100 }
}

class LightThing: WeightCalculatable {
    typealias WeightType = Double
    
    var weight: Double { 0.025 }
}

protocol Wheeled {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}

class Bike1: Vehicle, Wheeled {
    
    var numberOfWheels: Int = 2
    var wheelSize: Double = 16.0
    
    var peddling = false
    var brakes = false
    
    func accelerate() {
        peddling = true
        brakes = false
    }
    
    func stop() {
        peddling = false
        brakes = true
    }
    
}

func roundAndRound(transportation: Vehicle & Wheeled) {
    transportation.stop()
    print("Brakes are being applied to \(transportation.numberOfWheels) wheels")
}

roundAndRound(transportation: Bike1())
