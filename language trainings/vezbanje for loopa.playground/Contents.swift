import UIKit

//Sum of first 10 natural numbers

func sumFirst10() {
    var sum = 0
    for i in 1...10 {
    sum += i
    }
    sum
}
sumFirst10()
//-----------------------------------------------
// Display n terms of natural number and their sum.

func naturalNumberSum(n: Int){
var sum = 0
    for i in 1...n {
        sum += i
    }
    sum
}
naturalNumberSum(n: 7)

//------------------------------------------------
// Read 10 numbers from keyboard and find their sum and average.

func firstNumSumAndAverage() {
    var sum = 0
    var average: Double = 0
    for i in 1...10 {
        sum += i
        average = Double(sum) / 10.0
    }
    sum
    average
}
firstNumSumAndAverage()

//--------------------------------------------------
// Display the cube of the number upto given an integer.

func cubeToInteger(number: Int) {
    var cube = 0
    for i in 1...number {
        cube = i * i * i
        print("Number is \(i) and cube of \(i) is \(cube)")
    }
    cube
}
cubeToInteger(number: 10)

//-----------------------------------------------------
// Display the multiplication table of a given integer.

func multiplicationTableOfInt(number: Int) {
    for i in 1...10 {
        print("\(number) * \(i) = \(number * i)")
    }
}
multiplicationTableOfInt(number: 15)

//-----------------------------------------------------
// Display the multipliaction table from 1 to n.

func multiplicationTable(n: Int){
    for i in 1...n {
        for j in 1...10 {
            print("\(i) * \(j) = \(i * j)")
        }
    }
}
multiplicationTable(n: 8)

//----------------------------------------------------
// Display the n terms of odd natural number and their sum.

func oddNumbersSum(nextNum: Int) {
    var sum = 0
    var oddNumbers = 0
    for i in 1...nextNum {
        sum += 2 * i - 1
        oddNumbers = 2 * i - 1
        print("Odd number: \(oddNumbers)")
    }
    print("The sum of odd number up to \(nextNum): \(sum)")
}
oddNumbersSum(nextNum: 10)

//------------------------------------------------------
// Display the pattern like right angle triangle using an asterisk.

func printAsterisk(lenght: Int) {
    var asterisk = ""
    for _ in 1...lenght {
        asterisk += "*"
        print(asterisk)
    }
}
printAsterisk(lenght: 5)

//----------------------------------------------
// Display the pattern like right angle triangle with a number.

func printNumberTriangle(lenght: Int) {
    var numbers = ""
    for i in 1...lenght {
        numbers += "\(i)"
        print(numbers)
    }
}
printNumberTriangle(lenght: 9)

//-------------------------------------------------
// Make such a pattern like right angle triangle with a number which will repeat a number in a row.

func printSameNumbersTriangle(lenght: Int) {
    var numbers = ""
    for i in 1...lenght {
        for _ in 1...i {
           numbers += "\(i)"
           print(numbers)
        }
    }
}
printSameNumbersTriangle(lenght: 5)

//-------------------------------------------------
// Calculate the factorial of a given number.

func factiorial(number: Int) {
    var fact = 1
    for i in 1...number {
        fact = fact * i
    }
    print(fact)
}
factiorial(number: 5)

//---------------------------------------------------
// Display the n terms of even natural number and their sum.

func evenNumbersAndSum(lenght: Int) {
    var sum = 0
    var evenNumbers = 0
    for i in 1...lenght {
        sum += i + i
        evenNumbers = i + i
        print("Even numbers: \(evenNumbers)")
    }
    print(sum)
}
evenNumbersAndSum(lenght: 5)

//----------------------------------------------------
// Display the n terms of harmonic series and their sum.

func harmonicSeries(lenght: Int) {
    var sum: Double = 0
    for i in 1...lenght {
        sum += Double(1) / Double(i)
    }
    print(sum)
}
harmonicSeries(lenght: 5)

//-----------------------------------------------------
// Display the sum of the series [ 9 + 99 + 999 + 9999 ...]

func nineSeries(lenght: Int) {
    var nine = 9
    var sum = 0
    for _ in 0..<lenght {
        sum += nine
        print(nine)
        nine = nine * 10 + 9
    }
    print(sum)
}
nineSeries(lenght: 5)

//-------------------------------------------------------
// Find the sum of the series [ x + x^3 + x^5 + ......]

func seriesXon(x: Decimal, lenght: Int) {
    var sum: Decimal = 0
    var oddNumbers = 0
    for i in 1...lenght {
        oddNumbers = 2 * i - 1
        sum += x + pow(x , oddNumbers)
    }
    print(sum)
}
seriesXon(x: 2, lenght: 5)

//-----------------------------------------------------------
// Display the n terms of square natural number and their sum.

func squareOfNatural(lenght: Int) {
    var sum = 0
    for i in 1...lenght {
        sum += i * i
    }
    print(sum)
}
squareOfNatural(lenght: 5)

//-------------------------------------------------
// find the sum of the series 1 +11 + 111 + 1111 + .. n terms.

func seriesWithOne(lenght: Int) {
    var one = 1
    var sum = 0
    for _ in 1...lenght {
        sum += one
        print(one)
        one = one * 10 + 1
    }
    print(sum)
}
seriesWithOne(lenght: 5)

//---------------------------------------------------------
// Check if given number is perfect

func perfectNumber(number: Int) {
    var sum = 0
    for i in 1..<number {
        if number % i == 0 {
            sum = sum + i
            print(sum)
        }
    }
    print("Sum of divisor: \(sum)")
    if sum == number {
        print("Number is perfect")
    } else {
        print("Number is not perfect")
    }
}
perfectNumber(number: 56)

//---------------------------------------------------------
// Prime number

func primeNumber(number: Int) -> Bool {
    if number < 1 {
        return false
    } else if number <= 3 {
        return true
    }
    let doubleNumber = Double(number)
    let rootNumber = Int(sqrt(doubleNumber))
    for i in 2...rootNumber {
        if Int(doubleNumber) % i == 0 {
            return false
        }
    }
    return true
}
print("The number is prime: \(primeNumber(number: 13))")

//---------------------------------------------------
// Find the number and sum of all integer between 100 and 200 which are divisible by 9.

func divisibleByNine(startNum: Int, endNum: Int) {
    if startNum > endNum {
        print("Start number must be greater")
    }
    for i in startNum...endNum {
        if i % 9 == 0 {
            print(i)
        }
    }
}
divisibleByNine(startNum: 100, endNum: 200)
