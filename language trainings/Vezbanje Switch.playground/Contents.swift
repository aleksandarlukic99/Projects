import UIKit

// Accept two integers and check whether they are equal or not.

func equalNumbers(a: Int, b: Int) {
    switch (a, b) {
    case _ where a == b:
        print("first number \(a) and sencond number \(b) are equal")
    default:
        print("Numbers are not equal.")
    }
}
equalNumbers(a: 5, b: 56)

//-----------------------------------------------
// Check whether a given number is even or odd.

func numberEvenOrOdd(number: Int) {
    switch number {
    case _ where number % 2 == 1:
        print("\(number) is odd")
    case _ where number % 2 == 0:
        print("\(number) is even")
    default:
        break
    }
}
numberEvenOrOdd(number: 5)

//-------------------------------------------------
// Check if number is positive or negative

func positiveOrNegative(number: Int) {
    switch number {
    case _ where number < 0:
        print("\(number) is negative.")
    case let number where number > 0:
        print("\(number) is positive")
    default:
        print("Number is 0")
    }
}
positiveOrNegative(number: -5)

//----------------------------------------------------
// Find if is year leap or not
func leapYear(year: Int) {
    switch year {
    case _ where year % 4 == 0 && year % 100 != 0 || year % 400 == 0:
        print("\(year) is leap")
    default:
        print("\(year) is not leap")
    }
}
leapYear(year: 2016)

//-----------------------------------------------------
// Determine if candidate can cast vote or can't

func canPersonVote(yearsOld: Int) {
    switch yearsOld {
    case _ where yearsOld >= 18:
        print("The person can vote.")
    default:
        print("Person cant vote")
    }
}
canPersonVote(yearsOld: 18)

//-------------------------------------------------------
// Read the value of integer m and display the value of n is 1 when m is larger than 0, when m is 0 and -1 when m is less than 0

func numberValue(number m: Int) {
    switch m {
    case var n where m > 0:
        n = 1
        print("The value of number is n = \(n)")
    case var n where m == 0:
        n = 0
        print("The value of number is n = \(n)")
    default:
        print("The value of number is n = -1")
    }
}
numberValue(number: -123)

//---------------------------------------------------------
//Write the person height in cm and categorize it according to their height.

func personHeightCategorization(height: Int) {
    switch height {
    case 0..<150:
        print("Person is dwarf.")
    case 150..<170:
        print("Person is short.")
    case 170..<180:
        print("Person is average height.")
    case 180..<200:
        print("Person is tall.")
    case _ where height >= 200:
        print("Person is giant.")
    default:
        break
    }
}
personHeightCategorization(height: 135)

//----------------------------------------------------------
// Find the largest of 3 numbers

func findingLargestNumber(first: Int, second: Int, third: Int) {
    switch (first, second, third) {
    case _ where first > second && first > third:
        print("The first number \(first) is greatest")
    case _ where second > first && second > third:
        print("The second number \(second) is greatest")
    case _ where third > first && third > second:
        print("The third number \(third) is greatest")
    default:
        print("There is no greatest number")
    }
}
findingLargestNumber(first: 5, second: 5, third: 9)

//--------------------------------------------------------------
// Accept a coordinate point in XY coordinate system and determine in which quadrant the coordiante point lies

func coordinateQuadrants(x: Int, y: Int) {
    switch (x, y) {
    case _ where x > 0 && y > 0:
        print("\(x), \(y) are in first quadrant")
    case _ where x < 0 && y > 0:
        print("\(x), \(y) are in second quadrant")
    case _ where x < 0 && y < 0:
        print("\(x), \(y) are in third quadrant")
    case _ where x > 0 && y < 0:
        print("\(x), \(y) are in forth quadrant")
    case _ where x == 0 && (y > 0 || y < 0):
        print("On Y axis")
    case _ where y == 0 && (x > 0 || x < 0):
        print("On x axis")
    default:
        print("In the middle")
    }
}
coordinateQuadrants(x: 9, y: -3)

//-----------------------------------------------
/*
 Find the eligibility of admission for a professional course based on the following criteria:
 Eligibility Criteria : Marks in Maths >=65 and Marks in Phy >=55 and Marks in Chem>=50 and Total in all three subject >=190 or Total in Maths and Physics >=140 ------------------------------------- Input the marks obtained in Physics :65 Input the marks obtained in Chemistry :51 Input the marks obtained in Mathematics :72 Total marks of Maths, Physics and Chemistry : 188 Total marks of Maths and Physics : 137 The candidate is not eligible.
 */

func passCriteria(math: Int, phy: Int, chem: Int) {
    switch (math, phy, chem) {
    case _ where math >= 65 && phy >= 55 && chem >= 50 && (math + phy + chem >= 190 || math + phy >= 140):
        print("Candidate is eligible")
    default:
        print("Candidate is not eligible")
    }
}
passCriteria(math: 75, phy: 65, chem: 51)

//---------------------------------------------------
// Calculate the root of quadric equation

func quadricEquation(a: Double, b: Double, c: Double) {
    let D: Double = (b * b) - 4 * a * c
    switch D {
    case _ where D < 0:
        print("Roots are imaginary, no solution")
    case _ where D == 0:
        print("There is one real root")
    default:
        let x1: Double = (-b + sqrt(D)) / (2 * a)
        let x2: Double = (-b - sqrt(D)) / (2 * a)
        print("x1: \(x1),x2: \(x2)")
    }
}
quadricEquation(a: 1, b: 5, c: 2)

//----------------------------------------------------
/*
 Read roll no, name and marks of three subjects and calculate the total, percentage and division.
 Test Data :
 Input the Roll Number of the student :784
 Input the Name of the Student :James
 Input the marks of Physics, Chemistry and Computer Application : 70 80 90
 */

func studentPercentageAndDivision(rollNumber: Int, studentName: String, phyMark: Int, chemMark: Int, compAppMark: Int) {
    let totalMarks = phyMark + chemMark + compAppMark
    let percentage: Double = Double(totalMarks) / 3
    switch percentage {
    case 70...100:
        print("""
            Name of student: \(studentName)
            Roll number: \(rollNumber)
            Marks in physics: \(phyMark)
            Marks in chemistry: \(chemMark)
            Marks in Computer Application: \(compAppMark)
            Total marks = \(totalMarks)
            Percentage = \(percentage)
            Division = First
            """)
    case 50..<70:
        print("""
            Name of student: \(studentName)
            Roll number: \(rollNumber)
            Marks in physics: \(phyMark)
            Marks in chemistry: \(chemMark)
            Marks in Computer Application: \(compAppMark)
            Total marks = \(totalMarks)
            Percentage = \(percentage)
            Division = Second
            """)
    case 0..<50:
        print("You didnt pass.")
    default:
        ("Invalid numbers")
    }
    switch (rollNumber, phyMark, chemMark, compAppMark, totalMarks) {
    case _ where phyMark > 100 || chemMark > 100 || compAppMark > 100 || totalMarks > 300 || percentage > 100:
        print("Invalid numbers")
    default:
        break
    }
}
studentPercentageAndDivision(rollNumber: 784, studentName: "James", phyMark: 70, chemMark: 90 , compAppMark: 100)

//-------------------------------------------
/*
 Read temperature in celsius and display a suitable message according to temperature state below :
 Temp < 0 then Freezing weather
 Temp 0-10 then Very Cold weather
 Temp 10-20 then Cold weather
 Temp 20-30 then Normal in Temp
 Temp 30-40 then Its Hot
 Temp >=40 then Its Very Hot
 */

func temperatureCelsius(temperature: Int) {
    switch temperature {
    case _ where temperature < 0:
        print("Freezing weather")
    case 0..<10:
        print("Very cold weather")
    case 10..<20:
        print("Cold weather")
    case 20..<30:
        print("Normal temperature")
    case 30..<40:
        print("Its hot")
    case _ where temperature >= 40:
        print("Its very hot")
    default:
        break
    }
}
temperatureCelsius(temperature: -13)

//-------------------------------------------
// Check whether a triangle is Equilateral, Isosceles or Scalene.

func triangleTypeBySides(a: Int, b: Int, c: Int) {
    switch (a, b, c) {
    case _ where a == b && b == c && c == a:
        print("Triangle is Equilateral")
    case _ where a == b || b == c || c == a:
        print("Triangle is Isosceles")
    default:
        print("Triangle is Scalene")
    }
}
triangleTypeBySides(a: 50, b: 70, c: 40)

//-------------------------------------------------
// Check whether a triangle can be formed by the given value for the angles.

func triangleTypeByAngles(a: Int, b: Int, c: Int) {
    let totalAngles = a + b + c
    switch (a, b, c, totalAngles) {
    case _ where a < 1 || b < 1 || c < 1 || totalAngles < 180 || totalAngles > 180:
        print("Triangle not valid")
    case _ where a < 90 && b < 90 && c < 90:
        print("Triangle is Acute")
    case _ where a == 90 || b == 90 || c == 90:
        print("Triangle is Right")
    case _ where a > 90 || b > 90 || c > 90:
        print("Triangle is Obtuse")
    default:
        break
    }
}
triangleTypeByAngles(a: 1, b: 90, c: 89)

//------------------------------------------------
// Check whether a character is an alphabet, digit or special character

func characterCheck(character: String) {
    switch character {
    case _ where character.count > 1:
        print("Not only 1 character")
    case "q", "w", "r","t", "y", "p", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m", "Q", "W", "R", "T", "Y", "P", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M", "a", "e", "i", "o", "u", "A", "E", "I", "O", "U":
        print("\(character) is alphabet")
    case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0":
        print("\(character) is digit")
    default:
        print("\(character) is special")
    }
}
characterCheck(character: "x")

//-----------------------------------------------------
// Check whether an alphabet is a vowel or consonant.

func vowelOrConsonant(character: String) {
    switch(character) {
    case _ where character.count > 1:
        print("Not character")
    case "q", "w", "r","t", "y", "p", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m", "Q", "W", "R", "T", "Y", "P", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M":
        print("\(character) is consonant")
    case "e", "u", "i", "o", "a", "A", "E", "I", "O", "U":
        print("\(character) is vowel")
    default:
        print("Not vowel or consonant")
    }
}
vowelOrConsonant(character: "2")

//---------------------------------------------------
// Calculate the profit and loss on transcation

func profitOrLoss(costPrice: Int, sellPrice: Int) {
    let profit = sellPrice - costPrice
    switch profit {
    case _ where sellPrice > costPrice:
        print("You profited: \(profit)")
    case _ where sellPrice < costPrice:
        print("You lost: \(profit)")
    default:
        print("You are on positive 0")
    }
}
profitOrLoss(costPrice: 700, sellPrice: 500)

//----------------------------------------------------
/*
  Calculate and print the Electricity bill of a given customer. The customer id., name and unit consumed by the user should be taken from the keyboard and display the total amount to pay to the customer. The charge are as follow:
  Unit                               Charge/unit
  upto 199                           @1.20
  200 and above but less than 400    @1.50
  400 and above but less than 600    @1.80
  600 and above                      @2.00
  If bill exceeds Rs. 400 then a surcharge of 15% will be charged and the minimum bill should be of Rs. 100/-
*/

func electrivityBill(customerID: Int, name: String, unitsConsumed: Double) {
    switch unitsConsumed {
    case 0..<200:
        let bill: Double = unitsConsumed * 1.20
        print("""
            Customer ID: \(customerID)
            Customer Name: \(name)
            unit Consumed: \(unitsConsumed)
            Amount Charges @Rs. 1.20 per unit: \(bill)
            Surcharge Amount: 0
            Net Amount Paid By the Costumer: \(bill)
            """)
        switch bill {
        case 0...100:
        print("""
            Customer ID: \(customerID)
            Customer Name: \(name)
            unit Consumed: \(unitsConsumed)
            Amount Charges @Rs. 1.20 per unit: \(bill)
            Surcharge Amount: 0
            Net Amount Paid By the Costumer: 100
            """)
        default:
            print("Bill cant be less than 0")
        }
    case 200..<400:
        let bill: Double = unitsConsumed * 1.50
        switch bill {
        case _ where bill > 400:
            let surchargeAmount = bill * 0.15
            print("""
                Customer ID: \(customerID)
                Customer Name: \(name)
                unit Consumed: \(unitsConsumed)
                Amount Charges @Rs. 1.50 per unit: \(bill)
                Surcharge Amount: \(surchargeAmount)
                Net Amount Paid By the Costumer: \(bill + surchargeAmount)
                """)
        case 100..<400:
            print("""
                Customer ID: \(customerID)
                Customer Name: \(name)
                unit Consumed: \(unitsConsumed)
                Amount Charges @Rs. 1.50 per unit: \(bill)
                Surcharge Amount: 0
                Net Amount Paid By the Costumer: \(bill)
                """)
        default:
            print("Cant be less than 100")
        }
    case 400..<600:
        let bill: Double = unitsConsumed * 1.80
        let surchargeAmount = bill * 0.15
        print("""
            Customer ID: \(customerID)
            Customer Name: \(name)
            unit Consumed: \(unitsConsumed)
            Amount Charges @Rs. 1.80 per unit: \(bill)
            Surcharge Amount: \(surchargeAmount)
            Net Amount Paid By the Costumer: \(bill + surchargeAmount)
            """)
    case _ where unitsConsumed >= 600:
        let bill: Double = unitsConsumed * 2.00
        let surchargeAmount = bill * 0.15
        print("""
            Customer ID: \(customerID)
            Customer Name: \(name)
            unit Consumed: \(unitsConsumed)
            Amount Charges @Rs. 2.00 per unit: \(bill)
            Surcharge Amount: \(surchargeAmount)
            Net Amount Paid By the Costumer: \(bill + surchargeAmount)
            """)
    default:
        print("Something is wrong with your arguments")
    }
}
electrivityBill(customerID: 1001, name: "James", unitsConsumed: 500)

//---------------------------------------------------------------------
/*
 Accept a grade and declare the equivalent description:

Grade    Description
E        Excellent
V        Very Good
G        Good
A        Average
F        Fail
 */

func inputGrade(grade: String) {
    switch grade {
    case "F":
        print("Fail")
    case "A":
        print("Average")
    case "G":
        print("Good")
    case "V":
        print("Very good")
    case "E":
        print("Excellent")
    default:
        print("Invalid grade")
    }
}
inputGrade(grade: "V")

//--------------------------------------------
// Read any day number in integer and display day name in the word.

func dayByNumber(day: Int) {
    switch day {
    case 1:
        print("Monday")
    case 2:
        print("Tuesday")
    case 3:
        print("Wednesday")
    case 4:
        print("Thursday")
    case 5:
        print("Friday")
    case 6:
        print("Saturday")
    case 7:
        print("Sunday")
    default:
        print("Invalid day")
    }
}
dayByNumber(day: 5)

//--------------------------------------------
// Read digit and write in word

func digitInWord(number: Int) {
    switch number {
    case 0:
        print("Zero")
    case 1:
        print("One")
    case 2:
        print("Two")
    case 3:
        print("Three")
    case 4:
        print("Four")
    case 5:
        print("Five")
    case 6:
        print("Six")
    case 7:
        print("Seven")
    case 8:
        print("Eight")
    case 9:
        print("Nine")
    default:
        print("Only numbers from 0 to 9")
    }
}
digitInWord(number: 9)

//------------------------------------------------------
//Read any Month Number in integer and display Month name in the word.

func digitMonthToWord(numberOfMonth: Int) {
    switch numberOfMonth {
    case 1:
        print("January")
    case 2:
        print("February")
    case 3:
        print("March")
    case 4:
        print("April")
    case 5:
        print("May")
    case 6:
        print("June")
    case 7:
        print("July")
    case 8:
        print("August")
    case 9:
        print("September")
    case 10:
        print("October")
    case 11:
        print("November")
    case 12:
        print("December")
    default:
        print("Invalid month")
    }
}
digitMonthToWord(numberOfMonth: 9)

//----------------------------------------------------
// Read any Month Number in integer and display the number of days for this month.

func numberOfDaysInMonth(month: Int) {
    switch month {
    case 1,3,5,7,8,10,12:
        print("Month have 31 days")
    case 4,6,9,11:
        print("Month have 30 days")
    case 2:
        print("Month have 28 days, on leap years 29")
    default:
        print("Invalid month")
    }
}
numberOfDaysInMonth(month: 2)

//----------------------------------------------------
// Compute the area of the various geometrical shape.

func computeAreaOfShape(shape: String, a: Double, b: Double) {
    switch shape {
    case "circle":
        let area = 3.14 * a * a
        print("The area of \(shape) is: \(area)")
    case "rectangle":
        let area = a * b
        print("The area of \(shape) is: \(area)")
    case "triangle":
        let area = 0.5 * a * b
        print("The area of \(shape) is: \(area)")
    default:
        print("Cant compute the area of \(shape)")
    }
}
computeAreaOfShape(shape: "triangle", a: 5, b: 10)

//----------------------------------------------------
// Simple operations

func simpleOperations(operation: String, a: Double, b: Double) {
    switch operation {
    case "+":
        let add = a + b
        print("The \(operation) of \(a) and \(b) is \(add)")
    case "-":
        let sub = a - b
        print("The \(operation) of \(a) and \(b) is \(sub)")
    case "*":
        let multiply = a * b
        print("The \(operation) of \(a) and \(b) is \(multiply)")
    case "/":
        let division = a / b
        print("The \(operation) of \(a) and \(b) is \(division)")
    default:
        print("Wrong operation")
    }
}
simpleOperations(operation: "/", a: 10, b: 2)
