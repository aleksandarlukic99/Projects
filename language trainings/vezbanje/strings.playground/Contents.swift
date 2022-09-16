import UIKit

// Printing every character individualy

let string = "Matt"
for char in string {
    print(char)
}

// Counting characters

let stringLenght = string.count

/*
 
 let fourthChar = string[3]
 
 - This will not work because strings dont have a fixed stize, so cant be accessed like array
 
 */

//GRAPHEME CLUSTERS

/*
 -There is two ways to represent some characters.
 -One way is é in café
 -Next is e with acute accent
 -The one character is represented with code point 233
 -The two character is combining codes 101 and 769, a special character that modifies the previous character
 */

let cafeNormal = "café"
let cafeCombining = "cafe\u{0301}"

cafeNormal.count
cafeCombining.count

// WE can count the number of unicode points

cafeNormal.unicodeScalars.count
cafeCombining.unicodeScalars.count

for codePoint in cafeCombining.unicodeScalars {
    print(codePoint.value)
}


// INDEX STRINGS

//Obtaining start index of string

let firstIndex = cafeCombining.startIndex

//firstIndex is of type String.Index

let firstChar = cafeCombining[firstIndex]

//Obtaining last grapheme cluster:

/*
let lastIndex = cafeCombining.endIndex
let lastChar = cafeCombining[lastIndex]
 
 Error because endIndex is one past the end of string, so we need to do this
*/

let lastIndex = cafeCombining.index(before: cafeCombining.endIndex)
let lastChar = cafeCombining[lastIndex]

//We can obtain the character of that index

let fourthIndex = cafeCombining.index(cafeCombining.startIndex,
                                      offsetBy: 3)
let fourthChar = cafeCombining[fourthIndex]

//We can access code points in character type through unicodeScalars

fourthChar.unicodeScalars.count
fourthChar.unicodeScalars.forEach { codePoint in
    print(codePoint.value)
}

// EQUALITY WITH COMBINING CHARACTERS

let equal = cafeNormal == cafeCombining

/*
 In swift this is equal, in other languanges wouldnt be because they check code points
 */

// STRINGS AS BI-DIRECTIONAL COLLECTIONS

let name = "Matt"
let backwardsName = name.reversed()

//Accessing char is same as before:

let secondCharIndex = backwardsName.index(backwardsName.startIndex,
                                          offsetBy: 1)
let secondChar = backwardsName[secondCharIndex]

//full backwards string

let backwardsString = String(backwardsName)

//RAW STRINGS

//Raw string is useful when you want to avoid special characters or strint interpolation

let raw1 = #"Raw "No escaping" \(no interpolation!). Use all the \ you want!"#
print(raw1)

let raw2 = ##"Aren't we "# clever"##
print(raw2)

//We can use any number of ## as long as the beggining and end match like that.
//Using raw string and interpolation

let can = "can do that too"
let raw3 = #"Yes we \#(can)!"#

// SUBSTRINGS

// When we want to manipulate the strings we need to generate substrings
//That is pull out a part of the string into its own value

let fullName = "Matt Galloway"
let spaceIndex = fullName.firstIndex(of: " ")!
let firstName = fullName[fullName.startIndex..<spaceIndex]

// Open ended range only takes one index and assumes the other is either the start or the end of the collection
/* Rewriting last line of code using open-ended range:
 let firstName = fullName[..<spaceIndex]
 */
//Similary we can use one sided range to start at ceratain index and go to the end of the collection like:

let lastName = fullName[fullName.index(after: spaceIndex)...]

//Type is String.SubSequence, but that is allias of substring
//We can force this to be string:

let lastNameString = String(lastName)

//CHARACTER PROPERTIES

//Checking if is "x" in ASCII

let singleCharacter: Character = "x"
singleCharacter.isASCII

let space: Character = " "
space.isWhitespace

//Checking if is something hexadecimal digit or not

let hexDigit: Character = "d"
hexDigit.isHexDigit

//Can convert character to numberic value

let thaiNine: Character = "๙"
thaiNine.wholeNumberValue

//ENCODING

//UTF - 8

let char = "\u{00bd}"
for i in char.utf8 {
    print(i)
}

let characters = "+\u{00bd}\u{21e8}\u{1f643}"
for i in characters.utf8 {
    print("\(i) : \(String(i, radix:2))")
}

//UTF - 16

for i in characters.utf16 {
    print("\(i) : \(String(i, radix:2))")
}

//Converting indexes between encoding views

let arrowIndex = characters.firstIndex(of: "\u{21e8}")!
characters[arrowIndex]

if let unicodeScalarsIndex = arrowIndex.samePosition(in: characters.unicodeScalars) {
    characters.unicodeScalars[unicodeScalarsIndex]
}

if let utf8Index = arrowIndex.samePosition(in: characters.utf8) {
    characters.utf8[utf8Index]
}

if let utf16Index = arrowIndex.samePosition(in: characters.utf16) {
    characters.utf16[utf16Index]
}


/*
 Challenge 1: Character count
 
 “Write a function that takes a string and prints out the count of each character in the string.
 For bonus points, print them ordered by the count of each character.
 For bonus-bonus points, print it as a nice histogram.
 Hint: You could use # characters to draw the bars.”
 */

func characterCount(string: String) {
    var counts: [Character: Int] = [:]
    for i in string {
        counts[i, default: 0] += 1
    }
    let sortedKeys = counts.keys.sorted { counts[$0]! > counts[$1]! }
    
    for key in sortedKeys {
        let value = counts[key]!
        let hashes = String(repeating: "#", count: value)
        print("\(key): \(hashes): \(value)")
    }
}
characterCount(string: "Ko radi ne boji se gladi")

/*
 “Challenge 2: Word count
 Write a function that tells you how many words there are in a string. Do it without splitting the string.
 Hint: try iterating through the string yourself.”
 */

func wordCounter(string: String) {
    var count = 0
    var word = false
    for character in string {
        if character == " " {
            if word {
            count += 1
            }
            word = false
        } else {
            word = true
        }
    }
    
    if word {
        count += 1
    }
    print(count)
}
wordCounter(string: "Danas je lep dan.")

/*
 “Challenge 3: Name formatter
 Write a function that takes a string which looks like "Galloway, Matt" and returns one which looks like "Matt Galloway", i.e., the string goes from "<LAST_NAME>, <FIRST_NAME>" to "<FIRST_NAME> <LAST_NAME>".”
 */

func nameFormatter(name: String) -> String? {
    guard let indexOfComma = name.firstIndex(of: ",") else {
        return nil
    }
    let lastName = name[..<indexOfComma]
    let firstName = name[indexOfComma...].dropFirst(2)
    
    return firstName + " " + lastName
}
let formatedName = nameFormatter(name: "Lukic, Aleksandar")!
print(formatedName)

/*
 “Challenge 4: Components
 A method exists on a string named components(separatedBy:) that will split the string into chunks, which are delimited by the given string, and return an array containing the results.
 Your challenge is to implement this yourself.
 Hint: There exists a view on String named indices that lets you iterate through all the indices (of type String.Index) in the string. You will need to use this.”
 */

func splitAndReturnArray(string: String, delimiter: Character) -> [String] {
    var newArray = [String]()
    var lastWordIndex = string.startIndex
    
    for i in string.indices {
        if string[i] == delimiter {
            let substring = string[lastWordIndex..<i]
            newArray.append(String(substring))
            lastWordIndex = string.index(after: i)
        }
    }
    let substring = string[lastWordIndex..<string.endIndex]
    newArray.append(String(substring))
    
    return newArray
}
let pieces = splitAndReturnArray(string: "Petar,Filip,Dusan,Ivan", delimiter: ",")
print(pieces)

/*
 “Challenge 5: Word reverser
 Write a function which takes a string and returns a version of it with each individual word reversed.
 For example, if the string is “My dog is called Rover” then the resulting string would be "yM god si dellac revoR".
 Try to do it by iterating through the indices of the string until you find a space, and then reversing what was before it. Build up the result string by continually doing that as you iterate through the string.
 Hint: You’ll need to do a similar thing as you did for Challenge 4 but reverse the word each time. Try to explain to yourself, or the closest unsuspecting family member, why this is better in terms of memory usage than using the function you created in the previous challenge”
 */

func wordReverser(string: String) -> String {
    var reversedWords = ""
    var lastWordIndex = string.startIndex
    
    for i in string.indices {
        if string[i] == " " {
            let substring = string[lastWordIndex..<i]
            reversedWords += substring.reversed() + " "
            lastWordIndex = string.index(after: i)
        }
    }
    let substring = string[lastWordIndex..<string.endIndex]
    reversedWords += substring.reversed()
    
    return reversedWords
}

let reversed = wordReverser(string: "Bez muke nema nauke")
print(reversed)
