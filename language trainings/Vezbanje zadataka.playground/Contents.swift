import UIKit

//Write a program to accept two Ints and check if they are euqal

func areEqual(a: Int, and b: Int) {
    if a == b {
        print("first number \(a) is equal to second \(b).")
    } else {
        print("first number \(a) is not equal \(b).")
    }
}
areEqual(a: 15, and: 15)

//--------------------------------------
//Checking if number is even or odd

func numberEvenOrOdd(_ number: Int) {
    if number % 2 == 1 {
        print("Number \(number) is odd.")
    } else if number % 2 == 0 {
        print("Number \(number) is even.")
    }
}
numberEvenOrOdd(15)

//=--------------------------------------
//Program that checks if number is positive or negative

func numberPositiveOrNegative(_ number: Int) {
    if number < 0 {
        print("Number \(number) is negative.")
    } else if number > 0 {
        print("Number \(number) is positive.")
    }
}
numberPositiveOrNegative(15)

//----------------------------------------
//Find if given year is leap or not

func leapYear(year: Int) {
    if year % 4 == 0 && year % 100 != 0 || year % 400 == 0 {
        print("Year \(year) is leap year.")
    } else {
        print("Year \(year) is not leap year.")
    }
}

leapYear(year: 2000)

//------------------------------------------
//Read the age of candidate and determine whether it is eligibile for casting vote

func canPersonVote(yearsOld: Int) {
    if yearsOld > 18 {
        print("Congratulation! You can cast vote.")
    } else {
        print("You cant cast vote.")
    }
}
canPersonVote(yearsOld: 21)

//-----------------------------------------
//Read the value of integer m and display the value of n is 1 when m is larger than 0, when m is 0 and -1 when m is less than 0

func whatsValue(number m: Int) {
    if m > 0 {
        let n = 1
        print("The value of number is n = \(n)")
    } else if m == 0 {
        let n = 0
        print("The value of number is n = \(n)")
    } else if m < 0 {
        let n = -1
        print("The value of number is n = \(n)")
    }
}
whatsValue(number: -5)

//---------------------------------------------
//Write the person height in cm and categorize it according to their height.

func personHeightCategorization(height: Int) {
    if height > 0 && height < 150 {
        print("The person is dwarf.")
    } else if height >= 150 && height < 170 {
        print("The person is short.")
    } else if height >= 170 && height < 180 {
        print("The person is normal height.")
    } else if height >= 180 && height < 200 {
        print("The person is tall.")
    } else if height >= 200 {
        print("The person is giant.")
    }
}
personHeightCategorization(height: 135)

//---------------------------------------------
//Find the largest of three numbers

func findingLargestOfThreeNumbers(first: Int, second: Int, third: Int) {
    if first > second && first > third {
        print("The first number = \(first) is greatest among three")
    } else if second > first && second > third {
        print("The second number = \(second) is greatest among three")
    } else if third > first && third > second {
        print("The third number = \(third) is greatest among three")
    } else {
        print("There is no greatest number")
    }
}
findingLargestOfThreeNumbers(first: 5, second: 3, third: 9)

//-------------------------------------------------
//Accept a coordinate point in XY coordinate system and determine in which quadrant the coordiante point lies

func xyQuadrants(x: Int, y: Int) {
    if x > 0 && y > 0 {
        print("\(x), \(y) are in first quadrant")
    } else if x < 0 && y > 0 {
        print("\(x), \(y) are in second quadrant")
    } else if x < 0 && y < 0 {
        print("\(x), \(y) are in third quadrant")
    } else if x > 0 && y < 0 {
        print("\(x), \(y) are in quadrant IV")
    } else {
        print("\(x), \(y)")
    }
}
xyQuadrants(x: 7, y: 9)

//------------------------------------------------
/*
 Find the eligibility of admission for a professional course based on the following criteria:
 Eligibility Criteria : Marks in Maths >=65 and Marks in Phy >=55 and Marks in Chem>=50 and Total in all three subject >=190 or Total in Maths and Physics >=140 ------------------------------------- Input the marks obtained in Physics :65 Input the marks obtained in Chemistry :51 Input the marks obtained in Mathematics :72 Total marks of Maths, Physics and Chemistry : 188 Total marks of Maths and Physics : 137 The candidate is not eligible. */

func marks(math: Int, phy: Int, chem: Int) {
    if math >= 65 && phy >= 55 && chem >= 50 && (math + phy + chem >= 190 || math + phy >= 140) {
        print("The candidate is eligible")
    } else {
        print("Candidate is not eligible")
    }
}
marks(math: 72, phy: 65, chem: 51)

//-----------------------------------------------------
//Calculate the root of Quadric Equation.

func quadricEquation(a: Double, b: Double, c: Double) {
    let D: Double = (b * b) - 4 * a * c
    if D < 0 {
        print("Roots are imaginary, no solution")
    } else if D == 0 {
        print("There is one real root")
    } else {
        let x1: Double = (-b + sqrt(D)) / (2 * a)
        let x2: Double = (-b - sqrt(D)) / (2 * a)
        print("x1: \(x1),x2: \(x2)")
    }
}

quadricEquation(a: 1, b: 5, c: 7)

//------------------------------------------------------
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
    if phyMark > 100 || chemMark > 100 || compAppMark > 100 || totalMarks > 300 || percentage > 100 {
        print("Invalid numbers")
    } else if percentage >= 70 && percentage <= 100 {
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
    } else if percentage < 70 && percentage >= 50 {
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
    } else if percentage < 50 && percentage >= 0 {
        print("You didn't pass.")
    }
}
studentPercentageAndDivision(rollNumber: 784, studentName: "James", phyMark: 70, chemMark: 80, compAppMark: 90)

//----------------------------------------------------------
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
    if temperature < 0 {
        print("Freezing weather.")
    } else if temperature >= 0 && temperature < 10 {
        print("Very cold weather.")
    } else if temperature >= 10 && temperature < 20 {
        print("Cold weather.")
    } else if temperature >= 20 && temperature < 30 {
        print("Normal temperature.")
    } else if temperature >= 30 && temperature < 40 {
        print("It's hot.")
    } else if temperature >= 40 {
        print("It's very hot.")
    }
}
temperatureCelsius(temperature: 90)

//----------------------------------------------------
// Check whether a triangle is Equilateral, Isosceles or Scalene.

func triangleTypeBySides(a: Int, b: Int, c: Int) {
    if a == b && b == c && c == a {
        print("Triangle is Equilateral.")
    } else if a == b || b == c || c == a {
        print("Triangle is Isosceles.")
    } else if a != b && b != c && c != a {
        print("Triangle is Scalene.")
    }
}
triangleTypeBySides(a: 50, b: 70, c: 60)

//-------------------------------------------------------
// Check whether a triangle can be formed by the given value for the angles.

func triangleTypeByAngles(a: Int, b: Int, c: Int) {
    let totalAngles = a + b + c
    if a < 1 || b < 1 || c < 1 || totalAngles < 180 || totalAngles > 180 {
        print("The triangle is not valid")
    } else if a < 90 && b < 90 && c < 90 {
        print("Triangle is Acute")
    } else if a == 90 || b == 90 || c == 90 {
        print("Triangle is Right")
    } else if a > 90 || b > 90 || c > 90 {
        print("Obtuse Triangle")
    }
}
triangleTypeByAngles(a: 0, b: 90, c: 90)

//-----------------------------------------------------------
// Check whether a character is an alphabet, digit or special character.

func characterCheck(character: String) {
    if character.count > 1 {
        print("Not only 1 charater")
    } else if character == "q" || character == "w" || character == "e" || character == "r" || character == "t" || character == "y" || character == "u" || character == "i" || character == "o" || character == "p" || character == "a" || character == "s" || character == "d" || character == "f" || character == "g" || character == "h" || character == "j" || character == "k" || character == "l" || character == "z" || character == "x" || character == "c" || character == "v" || character == "b" || character == "n" || character == "m" || character == "Q" || character == "W" || character == "E" || character == "R" || character == "T" || character == "Y" || character == "U" || character == "I" || character == "O" || character == "P" || character == "A" || character == "S" || character == "D" || character == "F" || character == "G" || character == "H" || character == "J" || character == "K" || character == "L" || character == "Z" || character == "X" || character == "C" || character == "V" || character == "B" || character == "N" || character == "M" {
        print("\(character) is alphabet")
    } else if character == "1" || character == "2" || character == "3" || character == "4" || character == "5" || character == "6" || character == "7" || character == "8" || character == "9" || character == "0" {
        print("\(character) is digit")
    } else {
        print("Special character")
    }
}
characterCheck(character: "@")

//----------------------------------------------------------
// Check whether an alphabet is a vowel or consonant.

func vowelOrConsonant(character: String) {
    if character.count > 1 {
        print("Not character")
    } else if character == "q" || character == "w" || character == "r" || character == "t" || character == "y" || character == "p" || character == "s" || character == "d" || character == "f" || character == "g" || character == "h" || character == "j" || character == "k" || character == "l" || character == "z" || character == "x" || character == "c" || character == "v" || character == "b" || character == "n" || character == "m" || character == "Q" || character == "W" || character == "R" || character == "T" || character == "Y" || character == "P" || character == "S" || character == "D" || character == "F" || character == "G" || character == "H" || character == "J" || character == "K" || character == "L" || character == "Z" || character == "X" || character == "C" || character == "V" || character == "B" || character == "N" || character == "M" {
        print("\(character) is consonant")
    } else if character == "e" || character == "u" || character == "i" || character == "o" || character == "a" || character == "A" || character == "E" || character == "I" || character == "O" || character == "U" {
        print("\(character) is vowel")
    } else {
        print("Not vowel or consonant")
    }
}
vowelOrConsonant(character: "k")

//-----------------------------------------------------------------------
// Calculate the profit and loss on transaction

func transactionProfitOrLoss(costPrice: Int, sellPrice: Int) {
    if costPrice < sellPrice {
        let profit = sellPrice - costPrice
        print("You profited \(profit)")
    } else if costPrice > sellPrice {
        let loss = costPrice - sellPrice
        print("You lost \(loss)")
    } else if costPrice == sellPrice {
        print("You are on positive 0")
    }
}
transactionProfitOrLoss(costPrice: 500, sellPrice: 700)

//------------------------------------------------------------------------
/*
 Calculate and print the Electricity bill of a given customer. The customer id., name and unit consumed by the user should be taken from the keyboard and display the total amount to pay to the customer. The charge are as follow:
 Unit                               Charge/unit
 upto 199                           @1.20
 200 and above but less than 400    @1.50
 400 and above but less than 600    @1.80
 600 and above                      @2.00
 If bill exceeds Rs. 400 then a surcharge of 15% will be charged and the minimum bill should be of Rs. 100/-
 */

func electricityBill(customerID: Int, name: String, unitsConsumed: Double) {
    if unitsConsumed < 200 {
        let bill: Double = unitsConsumed * 1.20
        print("""
            Customer ID: \(customerID)
            Customer Name: \(name)
            unit Consumed: \(unitsConsumed)
            Amount Charges @Rs. 1.20 per unit: \(bill)
            Surcharge Amount: 0
            Net Amount Paid By the Costumer: \(bill)
            """)
        if bill < 100 {
            print("""
                Customer ID: \(customerID)
                Customer Name: \(name)
                unit Consumed: \(unitsConsumed)
                Amount Charges @Rs. 1.20 per unit: \(bill)
                Surcharge Amount: 0
                Net Amount Paid By the Costumer: 100
                """)
        }
    } else if unitsConsumed >= 200 && unitsConsumed < 400 {
        let bill: Double = unitsConsumed * 1.50
        if bill > 400 {
            let surchargeAmount = bill * 0.15
            print("""
                Customer ID: \(customerID)
                Customer Name: \(name)
                unit Consumed: \(unitsConsumed)
                Amount Charges @Rs. 1.50 per unit: \(bill)
                Surcharge Amount: \(surchargeAmount)
                Net Amount Paid By the Costumer: \(bill + surchargeAmount)
                """)
        } else if bill < 400 {
        print("""
            Customer ID: \(customerID)
            Customer Name: \(name)
            unit Consumed: \(unitsConsumed)
            Amount Charges @Rs. 1.50 per unit: \(bill)
            Surcharge Amount: 0
            Net Amount Paid By the Costumer: \(bill)
            """)
        }
    } else if unitsConsumed >= 400 && unitsConsumed < 600 {
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
    } else if unitsConsumed >= 600 {
        let bill: Double = unitsConsumed * 2
        let surchargeAmount = bill * 0.15
        print("""
            Customer ID: \(customerID)
            Customer Name: \(name)
            unit Consumed: \(unitsConsumed)
            Amount Charges @Rs. 2.00 per unit: \(bill)
            Surcharge Amount: \(surchargeAmount)
            Net Amount Paid By the Costumer: \(bill + surchargeAmount)
            """)
    }
}
electricityBill(customerID: 1001, name: "James", unitsConsumed: 300)

//------------------------------------------------------------
/*
 Accept a grade and declare the equivalent description : Go to the editor

Grade    Description
E        Excellent
V        Very Good
G        Good
A        Average
F        Fail
 */

func inputGrade(grade: String) {
    if grade == "F" {
        print("Fail")
    } else if grade == "A" {
        print("Average")
    } else if grade == "G" {
        print("Good")
    } else if grade == "V" {
        print("Very good")
    } else if grade == "E" {
        print("Excellent")
    } else {
        print("Invalid grade!")
    }
}
inputGrade(grade: "A")

//-----------------------------------------------------
// Read any day number in integer and display day name in the word.

func dayByNumber(day: Int) {
    if day == 1 {
        print("Monday")
    } else if day == 2 {
        print("Tuesday")
    } else if day == 3 {
        print("Wednessday")
    } else if day == 4 {
        print("Thursday")
    } else if day == 5 {
        print("Friday")
    } else if day == 6 {
        print("Saturday")
    } else if day == 7 {
        print("Sunday")
    } else {
        print("That day maybe exist on Mars.")
    }
}
dayByNumber(day: 4)

//------------------------------------------------------
// Read digit and write in word

func digitInWord(number: Int) {
    if number == 0 {
        print("Zero")
    } else if number == 1 {
        print("One")
    } else if number == 2 {
        print("Two")
    } else if number == 3 {
        print("Three")
    } else if number == 4 {
        print("Four")
    } else if number == 5 {
        print("Five")
    } else if number == 6 {
        print("Six")
    } else if number == 7 {
        print("Seven")
    } else if number == 8 {
        print("Eight")
    } else if number == 9 {
        print("Nine")
    } else {
        print("I know only numbers from 0 to 9 :[ ")
    }
}
digitInWord(number: 7)

//-------------------------------------------------------
// Read any Month Number in integer and display Month name in the word.

func digitMonthToString(numberOfMonth: Int) {
    if numberOfMonth == 1 {
        print("January")
    } else if numberOfMonth == 2 {
        print("February")
    } else if numberOfMonth == 3 {
        print("March")
    } else if numberOfMonth == 4 {
        print("April")
    } else if numberOfMonth == 5 {
        print("May")
    } else if numberOfMonth == 6 {
        print("June")
    } else if numberOfMonth == 7 {
        print("July")
    } else if numberOfMonth == 8 {
        print("August")
    } else if numberOfMonth == 9 {
        print("September")
    } else if numberOfMonth == 10 {
        print("October")
    } else if numberOfMonth == 11 {
        print("November")
    } else if numberOfMonth == 12 {
        print("December")
    } else {
        print("Non existant month")
    }
}
digitMonthToString(numberOfMonth: 9)

//-------------------------------------------------
// Read any Month Number in integer and display the number of days for this month.

func numberOfDaysInMonth(month: Int) {
    if month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12 {
        print("Month have 31 days")
    } else if month == 4 || month == 6 || month == 9 || month == 11 {
        print("Month have 30 days")
    } else if month == 2 {
        print("Month have 28 days, on leap years 29.")
    }
}

//-----------------------------------------------------
// Compute the area of the various geometrical shape.

func computeAreaOfShape(shape: String, a: Double, b: Double) {
    if shape == "circle" {
        let area = 3.14 * a * a
        print("The area of \(shape) is: \(area)")
    } else if shape == "rectangle" {
        let area = a * b
        print("The area of \(shape) is: \(area)")
    } else if shape == "triangle" {
        let area = 0.5 * a * b
        print("The area of \(shape) is: \(area)")
    } else {
        print("Can't compute the area of \(shape)")
    }
}
computeAreaOfShape(shape: "triangle", a: 5, b: 1)

//------------------------------------------------------
// Simple operations.

func simpleOperations(operation: String, a: Double, b: Double) {
    if operation == "sum" {
        let add = a + b
        print("The \(operation) of \(a) and \(b) is \(add)")
    } else if operation == "subtraction" {
        let sub = a - b
        print("The \(operation) of \(a) and \(b) is \(sub)")
    } else if operation == "multiplication" {
        let multiply = a * b
        print("The \(operation) of \(a) and \(b) is \(multiply)")
    } else if operation == "division" {
        let division = a / b
        print("The \(operation) of \(a) and \(b) is \(division)")
    } else {
        print("Wrong operation.")
    }
}
simpleOperations(operation: "multiplication", a: 10, b: 2)
