import UIKit

func montyHall() {
    
    let randomNumber = Int.random(in: 1...3)
    
    var nagradnaVrata1 = false
    var nagradnaVrata2 = false
    var nagradnaVrata3 = false

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

    let izabranaVrata1 = "Izabrali ste prva vrata"
    let izabranaVrata2 = "Izabrali ste druga vrata"
    let izabranaVrata3 = "Izabrali ste treca vrata"
    let voditelj1 = "Voditelj je otvorio prva vrata"
    let voditelj2 = "Voditelj je otvorio druga vrata"
    let voditelj3 = "Voditelj je otvorio treca vrata"
    let finalnaVrataSaNagradom1 = "Izabrali ste prva vrata i osvojili auto!"
    let finalnaVrataSaNagradom2 = "Izabrali ste druga vrata i osvojili auto!"
    let finalnaVrataSaNagradom3 = "Izabrali ste treca vrata i osvojili auto!"
    let finalnaVrataBezNagrade1 = "Izabrali ste prva vrata i dobili ste patku"
    let finalnaVrataBezNagrade2 = "Izabrali ste druga vrata i dobili ste patku"
    let finalnaVrataBezNagrade3 = "Izabrali ste treca vrata i dobili ste patku"

    let izborVrata = Int.random(in: 1...3)
    
    func odabranaVrata(){
        if izborVrata == 1 {
            print(izabranaVrata1)
        } else if izborVrata == 2 {
            print(izabranaVrata2)
        } else if izborVrata == 3 {
            print(izabranaVrata3)
            }
    }
    odabranaVrata()
    
    let ostalaVrata1 = randomTwoThree()
    let ostalaVrata2 = randomOneThree()
    let ostalaVrata3 = randomOneTwo()
    
    func voditeljOtvara() {
        if izborVrata == 1 && nagradnaVrata1 == true {
            if ostalaVrata1 == 2 {
                print(voditelj2)
            } else if ostalaVrata1 == 3 {
                print(voditelj3)
            }
        } else if izborVrata == 2 && nagradnaVrata2 == true {
            if ostalaVrata2 == 1 {
                print(voditelj1)
            } else if ostalaVrata2 == 3 {
            print(voditelj3)
            }
        } else if izborVrata == 3 && nagradnaVrata3 == true {
            if ostalaVrata3 == 1 {
                print(voditelj1)
            } else if ostalaVrata3 == 2 {
                print(voditelj2)
            }
        } else if izborVrata == 1 && nagradnaVrata1 == false && nagradnaVrata2 == true {
            print(voditelj3)
        } else if izborVrata == 1 && nagradnaVrata1 == false && nagradnaVrata3 == true {
            print(voditelj2)
        } else if izborVrata == 2 && nagradnaVrata2 == false && nagradnaVrata3 == true {
            print(voditelj1)
        } else if izborVrata == 2 && nagradnaVrata2 == false && nagradnaVrata1 == true {
            print(voditelj3)
        } else if izborVrata == 3 && nagradnaVrata3 == false && nagradnaVrata1 == true {
            print(voditelj2)
        } else if izborVrata == 3 && nagradnaVrata3 == false && nagradnaVrata2 == true {
            print(voditelj1)
        }
    }
    voditeljOtvara()
    
    let otvaranjeVrata13 = randomOneThree()
    let otvaranjeVrata12 = randomOneTwo()
    let otvaranjeVrata23 = randomTwoThree()
    
    func otvaranjePoslednjihVrata() {
        if izborVrata == 1 && nagradnaVrata1 == true {
            if ostalaVrata1 == 2 {
                if otvaranjeVrata13 == 1 {
                    print(finalnaVrataSaNagradom1)
                } else if otvaranjeVrata13 == 3 {
                    print(finalnaVrataBezNagrade3)
                }
            } else if ostalaVrata1 == 3 {
                if otvaranjeVrata12 == 1 {
                    print(finalnaVrataSaNagradom1)
                } else if otvaranjeVrata12 == 2 {
                    print(finalnaVrataBezNagrade2)
                }
            }
        } else if izborVrata == 2 && nagradnaVrata2 == true {
            if ostalaVrata2 == 1 {
                if otvaranjeVrata23 == 2 {
                    print(finalnaVrataSaNagradom2)
                } else if otvaranjeVrata23 == 3 {
                    print(finalnaVrataBezNagrade3)
                }
            } else if ostalaVrata2 == 3 {
                if otvaranjeVrata12 == 1 {
                    print(finalnaVrataBezNagrade1)
                } else if otvaranjeVrata12 == 2 {
                    print(finalnaVrataSaNagradom2)
                }
            }
        } else if izborVrata == 3 && nagradnaVrata3 == true {
            if ostalaVrata3 == 1 {
                if otvaranjeVrata23 == 3 {
                    print(finalnaVrataSaNagradom3)
                } else if otvaranjeVrata23 == 3 {
                    print(finalnaVrataBezNagrade3)
                }
            } else if ostalaVrata3 == 2 {
                if otvaranjeVrata13 == 1 {
                    print(finalnaVrataBezNagrade1)
                } else if otvaranjeVrata13 == 3 {
                    print(finalnaVrataSaNagradom3)
                }
            }
        } else if izborVrata == 1 && nagradnaVrata1 == false && nagradnaVrata2 == true {
            if otvaranjeVrata12 == 1 {
                print(finalnaVrataBezNagrade1)
            } else if otvaranjeVrata12 == 2 {
                print(finalnaVrataSaNagradom2)
            }
        } else if izborVrata == 1 && nagradnaVrata1 == false && nagradnaVrata3 == true {
            if otvaranjeVrata13 == 1 {
                print(finalnaVrataBezNagrade1)
            } else if otvaranjeVrata13 == 3 {
                print(finalnaVrataSaNagradom3)
            }
        } else if izborVrata == 2 && nagradnaVrata2 == false && nagradnaVrata3 == true {
            if otvaranjeVrata23 == 2 {
                print(finalnaVrataBezNagrade2)
            } else if otvaranjeVrata23 == 3 {
                print(finalnaVrataSaNagradom3)
            }
        } else if izborVrata == 2 && nagradnaVrata2 == false && nagradnaVrata1 == true {
            if otvaranjeVrata12 == 1 {
                print(finalnaVrataSaNagradom1)
            } else if otvaranjeVrata12 == 2 {
                print(finalnaVrataSaNagradom2)
            }
        } else if izborVrata == 3 && nagradnaVrata3 == false && nagradnaVrata1 == true {
            if otvaranjeVrata13 == 1 {
                print(finalnaVrataSaNagradom1)
            } else if otvaranjeVrata13 == 3 {
                print(finalnaVrataBezNagrade3)
            }
        } else if izborVrata == 3 && nagradnaVrata3 == false && nagradnaVrata2 == true {
            if otvaranjeVrata23 == 2 {
                print(finalnaVrataSaNagradom2)
            } else if otvaranjeVrata23 == 3 {
                print(finalnaVrataBezNagrade3)
            }
        }
    }
    otvaranjePoslednjihVrata()
}
montyHall()

