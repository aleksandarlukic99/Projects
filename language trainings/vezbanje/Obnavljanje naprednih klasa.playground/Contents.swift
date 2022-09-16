import UIKit

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Student: Person {
    var grades: [Grade] = []
    
    func recordGrade(grade: Grade) {
        grades.append(grade)
    }
}

let john = Person(firstName: "Johnny", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")

let history = Grade(letter: "B", points: 9.0, credits: 3.0)
jane.recordGrade(grade: history)
//john.recordGrade - John is not student

class BandMember: Student {
    var minimumPracticeTime = 2
}

class OboePlayer: BandMember {
    override var minimumPracticeTime: Int {
        get {
            super.minimumPracticeTime * 2
        }
        set {
            super.minimumPracticeTime = newValue / 2
        }
    }
}

func phonebookName(person: Person) -> String {
    "\(person.lastName), \(person.firstName)"
}

let person = Person(firstName: "Johnny", lastName: "Appleseed")
let oboePlayer = OboePlayer(firstName: "Jane", lastName: "Appleseed")

phonebookName(person: person)
phonebookName(person: oboePlayer)

var hallMonitor = Student(firstName: "Jill", lastName: "BananaPeel")
hallMonitor = oboePlayer

oboePlayer as Student

hallMonitor as? BandMember
(hallMonitor as? BandMember)?.minimumPracticeTime

hallMonitor as! BandMember
(hallMonitor as! BandMember).minimumPracticeTime

if let hallMonitor = hallMonitor as? BandMember {
    print("This hall monitor is a band member and practices at least \(hallMonitor.minimumPracticeTime) hours per week")
}

func afterClassActivity(for student: Student) -> String {
    "Goes home!"
}

func afterClassActivity(for student: BandMember) -> String {
    "Goes to practice!"
}

afterClassActivity(for: oboePlayer)
afterClassActivity(for: oboePlayer as Student)

class StudentAthlete: Student {
    var failedClasses: [Grade] = []
    
    override func recordGrade(grade: Grade) {
        super.recordGrade(grade: grade)
        var newFailedClasses: [Grade] = []
        for grade in grades {
            if grade.letter == "F" {
            newFailedClasses.append(grade)
            }
        }
        failedClasses = newFailedClasses
    }
    var isEligible: Bool {
        failedClasses.count < 3
    }
}

final class FinalStudent: Person {}

class AnotherStudent: Person {
    final func recordGrade(grade: Grade) {}
}

/* CANT
 
class AnotherStudentAthlete: AnotherStudent {
    override func recordGrade(grade: Grade) {}
}
 
*/

class newStudentAthlete: Student {
    var sports: [String]
    
    init(firstName: String, lastName: String, sports: [String]) {
        self.sports = sports
        let passGrade = Grade(letter: "P", points: 0.0, credits: 0.0)
        super.init(firstName: firstName, lastName: lastName)
        recordGrade(grade: passGrade)
    }
}

class newStudent {
    let firstName: String
    let lastName: String
    var grades: [Grade] = []
    
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    convenience init(transfer: newStudent) {
        self.init(firstName: transfer.firstName,
                  lastName: transfer.lastName)
    }
    
    static var graduates = [String]()
    
    func recordGrade(grade: Grade) {
        grades.append(grade)
    }
    
    deinit {
      newStudent.graduates.append("\(lastName), \(firstName)")
    }
}

class newStudentAthlete1: newStudent {
    var sports: [String]
    required init(firstName: String, lastName: String) {
        self.sports = []
        super.init(firstName: firstName, lastName: lastName)
    }
    
    init(firstName: String, lastName: String, sports: [String]) {
        self.sports = sports
        let passGrade = Grade(letter: "P", points: 0.0, credits: 0.0)
        super.init(firstName: firstName, lastName: lastName)
        recordGrade(grade: passGrade)
    }
    
}

class Team {
    var players: [StudentAthlete] = []
    
    var isEligible: Bool {
        for player in players {
            if !player.isEligible {
                return false
            }
        }
        return true
    }
}

//Dugme koje se stiska
class Button {
    func press() {}
}

//Neka slika koja se renderuje na dugme
class Image {}

//Dugme koje je celo od slike
class ImageButton: Button {
    var image: Image
    
    init(image: Image) {
        self.image = image
    }
}

//Dugme koje renderuje tekst
class textButton: Button {
    var text: String
    
    init(text: String) {
        self.text = text
    }
}

var someone = Person(firstName: "John", lastName: "Appleseed")
//Reference count 1

var anotherSomeone: Person? = someone
//Reference count 2

var lotsOfPeople = [someone, someone, anotherSomeone, someone]
//Reference count 6

anotherSomeone = nil
//Reference count 5

lotsOfPeople = []
//Reference count 1

someone = Person(firstName: "John", lastName: "Appleseed")
//Reference count 0 for original person object

class Person1 {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    deinit {
        print("\(firstName) \(lastName) is removed")
    }
}

class Student2: Person1 {
    var partner: Student?
    var grades: [Grade] = []
    
    required override init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
        self.firstName = firstName
        self.lastName = lastName
    }
    
    convenience init(transfer: newStudent) {
        self.init(firstName: transfer.firstName,
                  lastName: transfer.lastName)
    }
    
    static var graduates = [String]()
    
    func recordGrade(grade: Grade) {
        grades.append(grade)
    }
    
    deinit {
      newStudent.graduates.append("\(lastName), \(firstName)")
    }
}


class A {
    init() {
        print("I am A! 1")
    }
    deinit {
        print("A is removed")
    }
    
}

class B: A {
    override init() {
        print("I am B! 1")
        super.init()
        print("I am B! 2")
    }
    deinit {
        print("B is removed")
    }
}

class C: B {
    override init() {
        print("I am C! 1")
        super.init()
        print("I am C! 2")
    }
    deinit {
        print("C is removed")
    }
}

do {
    let c = C()
    let _ = c as A
}

class StudentBaseballPlayer: StudentAthlete {
    var position: String
    var number: Int
    var battingAverage: Double = 0.0
    
    init(firstName: String, lastName: String, number: Int, position: String) {
      self.number = number
      self.position = position
      super.init(firstName: firstName, lastName: lastName)
    }
}
