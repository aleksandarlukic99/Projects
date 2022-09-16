import UIKit
import Foundation

class Item {
    var size: Size
    var color: Color
    var price: Double
    
    init(size: Size, color: Color, price: Double) {
        self.size = size
        self.color = color
        self.price = price
    }
    
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
}

class TShirt: Item {
    var image: String
    
    init(size: Item.Size, color: Item.Color, price: Double, image: String) {
        self.image = image
        super.init(size: size, color: color, price: price)
        self.size = size
        self.color = color
        self.price = price
    }
}

class Dux: Item {
    var image: String
    
    init(size: Item.Size, color: Item.Color, price: Double, image: String) {
        self.image = image
        super.init(size: size, color: color, price: price)
        self.size = size
        self.color = color
        self.price = price
    }
}

class Shorts: Item {
    override init(size: Item.Size, color: Item.Color, price: Double) {
        super.init(size: size, color: color, price: price)
        self.size = size
        self.color = color
        self.price = price
    }
}

class Pants: Item {
    override init(size: Item.Size, color: Item.Color, price: Double) {
        super.init(size: size, color: color, price: price)
        self.size = size
        self.color = color
        self.price = price
    }
}

extension Item: Equatable {
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        if lhs.color == rhs.color && lhs.price == rhs.price && lhs.size == rhs.size {
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
    var list: [Item] = []
    
    func addItem(item: Item, number: Int) {
        for _ in 0..<number {
            list.append(item)
        }
    }
    
    func numberOfKind(item: Item) {
        var count = 0
        for i in list {
            if i == item {
                count += 1
            }
        }
        if item == duks {
            print("\(dux) color \(item.color) i size \(item.size) have \(count)")
        } else if item == sorc {
            print("\(shorts) color \(item.color) i size \(item.size) have \(count)")
        } else if item == tshirt {
            print("\(shirt) color \(item.color) i size \(item.size) have \(count)")
        } else if item == pants {
            print("\(pantalones) color \(item.color) i size \(item.size) have \(count)")
        }
    }
    
    func numberOfKindItem(item: Item) -> Int {
        var count = 0
        for i in list {
            if i == item {
                count += 1
            }
        }
        return count
    }
}


class OrderManager: Invertory {
    
    func takeFromStore(item: Item, number: Int) {
        let numberInInvertory = numberOfKindItem(item: item)
        if number > numberInInvertory {
            print("Nema dovoljno \(item)")
        } else {
            let firstIndex = list.firstIndex(of: item)!
            for _ in 0..<number {
                list.remove(at: firstIndex)
            }
        }
        print("Items left: \(list.count)")
    }
}
let dux = "dux"
let shorts = "shorts"
let shirt = "tshirt"
let pantalones = "pantalones"

let duks = Dux(size: Item.Size.large, color: Item.Color.black, price: 22, image: "Konj")

let sorc = Shorts(size: Item.Size.small, color: Item.Color.blue, price: 12)

let tshirt = TShirt(size: Item.Size.medium, color: Item.Color.red, price: 9, image: "Sunce")

let pants = Pants(size: Item.Size.medium, color: Item.Color.blue, price: 20)

let addingAndOrdering = OrderManager()

func addedItems() {
    addingAndOrdering.addItem(item: duks, number: 6)
    addingAndOrdering.addItem(item: sorc, number: 9)
    addingAndOrdering.addItem(item: tshirt, number: 14)
    addingAndOrdering.addItem(item: pants, number: 7)
}

func numberOfItems(){
    addingAndOrdering.numberOfKind(item: duks)
    addingAndOrdering.numberOfKind(item: sorc)
    addingAndOrdering.numberOfKind(item: tshirt)
    addingAndOrdering.numberOfKind(item: pants)
}

func taking() {
    addingAndOrdering.takeFromStore(item: duks, number: 2)
    addingAndOrdering.takeFromStore(item: sorc, number: 3)
    addingAndOrdering.takeFromStore(item: tshirt, number: 6)
    addingAndOrdering.takeFromStore(item: pants, number: 2)
}

func shoping() {
    addedItems()
    numberOfItems()
    print("-----------------------------")
    taking()
    numberOfItems()
}
shoping()

addingAndOrdering.numberOfKindItem(item: duks)
