import UIKit


func printFullName(firstName: String, lastName: String ){
    print(firstName + " " + lastName)
    
}
printFullName(firstName: "Aleksandar", lastName: "Lukic")

func calculateFullName(_ firstName: String, _ lastName: String) -> (fullName: String, lenght: Int){
  let fullName = firstName + " " + lastName
    return(fullName, fullName.count)
}
var fullNameLenght = calculateFullName("Aca", "Lukic").lenght
