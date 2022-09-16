import UIKit

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let john = Person(firstName: "Johnny", lastName: "Appleseed")

class SimplePerson {
    let name: String
    init(name: String) {
        self.name = name
    }
}

var var1 = SimplePerson(name: "John")
var var2 = var1

var homeOwner = john
john.firstName = "John"
john.firstName
homeOwner.firstName

homeOwner.lastName = "Peach"
homeOwner.fullName
john.fullName

john === homeOwner

let imposterJohn = Person(firstName: "Johnny", lastName: "Appleseed")
john === homeOwner
john === imposterJohn
imposterJohn === homeOwner

homeOwner = imposterJohn
john === homeOwner

homeOwner = john
john === homeOwner

var imposters = (0...100).map { _ in
    Person(firstName: "John", lastName: "Appleseed")
}

imposters.contains {
    $0.firstName == john.firstName && $0.lastName == john.lastName
}

imposters.contains {
    $0 === john
}

imposters.insert(john, at: Int.random(in: 0..<100))

imposters.contains {
    $0 === john
}

if let indexOfJohn = imposters.firstIndex(where:
                                            { $0 === john }) {
    imposters[indexOfJohn].lastName = "Bananapeel"
}

john.fullName

let janer = Person(firstName: "Jane", lastName: "Appleseed")
let mike = Person(firstName: "Mike", lastName: "Peacher")

let group1 = [janer, janer, mike, mike, john]
let group2 = [janer, mike, mike, janer, mike]

func memberOf(person: Person, group: [Person]) -> Bool {
    group.contains(where: { $0 === person})
}

memberOf(person: john, group: group2)
memberOf(person: john, group: group1)

struct Grade {
    let letter: String
    let points: Double
    let credits: Double
}

class Student {
    var firstName: String
    var lastName: String
    var credits = 0.0
    var grades: [Grade] = []
    var gradePointsAverage: Double {
        var allPoints: Double = 0
        var averagePoints: Double = 0
        for grade in grades {
            allPoints += grade.points
        }
        averagePoints = allPoints / Double(grades.count)
        return averagePoints
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func recordGrade(grade: Grade) {
        grades.append(grade)
        credits += grade.credits
    }
}

var jane = Student(firstName: "Jane", lastName: "Appleseed")
let history = Grade(letter: "B", points: 9.0, credits: 3.0)
let math = Grade(letter: "A", points: 20.0, credits: 5.0)

jane.recordGrade(grade: history)
jane.recordGrade(grade: math)
jane.recordGrade(grade: math)

jane.credits

extension Student {
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

class User {
    var lists: [String: List] = [:]
    
    func addList(list: List) {
        lists[list.name] = list
    }
    
    func list(forName name: String) -> List? {
      lists[name]
    }
}

class List {
    var name: String
    var movies: [String] = []
    
    init(name: String) {
      self.name = name
    }

    func print() {
      Swift.print("Movie List: \(name)") // Prefix Swift is required to disambiguate
      for movie in movies {
        Swift.print(movie)
      }
      Swift.print("\n")
    }
}

let ivan = User()
let aca = User()

var actionList = List(name: "Action")

ivan.addList(list: actionList)
aca.addList(list: actionList)

ivan.lists["Action"]?.movies.append("Terminator")
ivan.lists["Action"]?.movies.append("Rambo")

aca.lists["Action"]?.movies.append("Undisputed")

ivan.lists["Action"]?.print()
aca.lists["Action"]?.print()
