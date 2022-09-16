import UIKit
import Foundation

struct TShirt {
    
    enum Size {
        case small
        case medium
        case large
    }

    enum Color {
        case blue
        case black
        case red
    }

    var size: Size
    var color: Color
    var price: Double
    let image: String
    
}

extension TShirt: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        if lhs.color == rhs.color && lhs.image == rhs.image && lhs.price == rhs.price && lhs.size == rhs.size {
            return true
        }
        return false
    }
}

class User {
    let name: String
    let email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}

struct Address {
    let name: String
    let street: String
    let city: String
    let zip: Int
}

class ShoppingCart {
    let order: [TShirt]
    let address: Address
    
    init(order: [TShirt], address: Address, list: [TShirt]) {
        self.order = order
        self.address = address
    }
    
    func totalPrice(tshirts: [TShirt]) -> Double {
        var total: Double = 0
        for tshirt in tshirts {
            total += tshirt.price
        }
        return total
    }
}

class Invertory {
    var list: [TShirt] = []
    
    func addTShirt(tshirt: TShirt, number: Int) {
        for _ in 0..<number {
            list.append(tshirt)
        }
    }
    
    func numberOfKind(tshirt: TShirt) {
        var count = 0
        for shirt in list {
            if tshirt == shirt {
                count += 1
            }
        }
        print("Majica boje \(tshirt.color) i velicine \(tshirt.size) ima \(count)")
    }
    
    func numberOfKindTShirts(tshirt: TShirt) -> Int {
        var count = 0
        for shirt in list {
            if tshirt == shirt {
                count += 1
            }
        }
        return count
    }
}


let tshirt = TShirt(size: TShirt.Size.medium, color: TShirt.Color.black, price: 13.2, image: "Patka")


class OrderManager: Invertory {
    
    func takeFromStore(tshirt: TShirt, number: Int) {
        let numberInInvertory = numberOfKindTShirts(tshirt: tshirt)
        if number > numberInInvertory {
            print("NEMA DOVOLJNO")
        } else {
            for shirt in 0..<number {
                list.remove(at: shirt)
            }
        }
        print("TShirts left: \(list.count)")
    }
}

let orderManager = OrderManager()
orderManager.addTShirt(tshirt: tshirt, number: 5)
orderManager.numberOfKindTShirts(tshirt: tshirt)
orderManager.takeFromStore(tshirt: tshirt, number: 3)
