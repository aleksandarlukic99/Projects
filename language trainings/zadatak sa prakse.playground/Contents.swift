import UIKit

var nagradnaVrata1 = false
var nagradnaVrata2 = false
var nagradnaVrata3 = false
var randomNumber = Int.random(in: 1...3)

if randomNumber == 1 {
    nagradnaVrata1 = true
} else if randomNumber == 2 {
    nagradnaVrata2 = true
} else if randomNumber == 3 {
    nagradnaVrata3 = true
}

func randomOneThree() -> Int {
    let array = [1, 3]
    return array.randomElement()!
}

func randomOneTwo() -> Int {
    let array = [1, 2]
    return array.randomElement()!
}

func randomTwoThree() -> Int {
    let array = [2, 3]
    return array.randomElement()!
}

var prviOdabirVrata = Int.random(in: 1...3)

if prviOdabirVrata == 1 {
    print("Odabrali ste prva vrata.")
    if nagradnaVrata1 == true {
        let ostalaVrata = Int.random(in: 2...3)
        print("Voditelj je otvorio vrata \(ostalaVrata)")
        if ostalaVrata == 2 {
            let izborVrata = randomOneThree()
            if izborVrata == 1 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste auto!")
            } else if izborVrata == 3 {
                print("Izabrali ste \(izborVrata) i osvojili ste patku")
            }
        } else if ostalaVrata == 3 {
            let izborVrata = randomOneTwo()
            if izborVrata == 1 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste auto!")
            } else if izborVrata == 2 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste patku")
            }
        }
    } else if nagradnaVrata1 == false {
        if nagradnaVrata2 == true {
        print("Voditelj je otvorio treca vrata.")
            let izborVrata = randomOneTwo()
            if izborVrata == 1 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste auto!")
            } else if izborVrata == 2 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste patku")
            }
        } else if nagradnaVrata3 == true {
            print("Voditelj je otvorio druga vrata")
            let izborVrata = randomOneThree()
            if izborVrata == 1 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste patku")
            } else if izborVrata == 3 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste auto!")
            }
        }
    }
}

else if prviOdabirVrata == 2 {
    print("Odabrali ste druga vrata")
    if nagradnaVrata2 == true {
        let ostalaVrata = randomOneThree()
        print("Voditelj je otvorio vrata \(ostalaVrata)")
        if ostalaVrata == 1 {
            let izborVrata = randomTwoThree()
            if izborVrata == 2 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste auto!")
            } else if izborVrata == 3 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste patku")
            }
        } else if ostalaVrata == 3 {
            let izborVrata = randomOneTwo()
            if izborVrata == 1 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste patku")
            } else if izborVrata == 2 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste auto!")
            }
        }
    } else if nagradnaVrata2 == false {
        if nagradnaVrata1 == true {
        print("Voditelj je otvorio treca vrata.")
            let izborVrata = randomOneTwo()
            if izborVrata == 1 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste auto!")
            } else if izborVrata == 2 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste patku")
            }
        } else if nagradnaVrata3 == true {
            print("Voditelj je otvorio prva vrata")
            let izborVrata = randomTwoThree()
            if izborVrata == 2 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste patku")
            } else if izborVrata == 3 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste auto!")
            }
        }
    }
}

else if prviOdabirVrata == 3 {
    print("Odabrali ste treca vrata")
    if nagradnaVrata3 == true {
        let ostalaVrata = Int.random(in: 1...2)
        print("Voditelj je otvorio vrata \(ostalaVrata)")
        if ostalaVrata == 1 {
            let izborVrata = randomTwoThree()
            if izborVrata == 2 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste patku")
            } else if izborVrata == 3 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste auto!")
            }
        } else if ostalaVrata == 2 {
            let izborVrata = randomOneThree()
            if izborVrata == 1 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste patku")
            } else if izborVrata == 3 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste auto!")
            }
        }
    } else if nagradnaVrata3 == false {
        if nagradnaVrata1 == true {
        print("Voditelj je otvorio druga vrata.")
            let izborVrata = randomOneThree()
            if izborVrata == 1 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste auto!")
            } else if izborVrata == 3 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste patku")
            }
        } else if nagradnaVrata2 == true {
            print("Voditelj je otvorio prva vrata")
            let izborVrata = randomTwoThree()
            if izborVrata == 2 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste patku")
            } else if izborVrata == 3 {
                print("Izabrali ste vrata \(izborVrata) i osvojili ste auto!")
            }
        }
    }
}











