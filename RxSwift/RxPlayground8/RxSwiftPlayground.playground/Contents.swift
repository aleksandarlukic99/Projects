import Foundation
import RxSwift
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// Start coding here!

example(of: "start with") {
    let numbers = Observable.of(2, 3, 4)
    
    let observable = numbers.startWith(1)
    observable.subscribe(onNext: { value in
        print(value)
    })
}

example(of: "Observable.concat") {
    let first = Observable.of(1, 2, 3)
    let second = Observable.of(4, 5, 6)
    
    let observable = Observable.concat([first, second])
    
    observable.subscribe(onNext: { value in
        print(value)
    })
}

example(of: "concat") {
    let germanCities = Observable.of("Berlin", "Munich", "Frankfurt")
    let spanishCities = Observable.of("Madrid", "Barcelona", "Valencia")
    
    let observable = germanCities.concat(spanishCities)
    observable
        .subscribe(onNext: {
            print($0)
        })
}

example(of: "concatMap") {
    let sequences = [
        "German cities": Observable.of("Berlin", "Munich", "Frankfurt"),
        "Spanish cities": Observable.of("Madrid", "Barcelona", "Valencia")
    ]
    
    let observable = Observable.of("German cities", "Spanish cities")
        .concatMap { country in
            sequences[country] ?? .empty()
        }
    
    observable.subscribe(onNext: {
        print($0)
    })
}

example(of: "merge") {
    let left = PublishSubject<String>()
    let right = PublishSubject<String>()
    
    let source = Observable.of(left.asObservable(), right.asObservable())
    
    let observable = source.merge()
    observable
        .subscribe(onNext: {
            print($0)
        })
    
    var leftValues = ["Berlin", "Munich", "Frankfurt"]
    var rightValues = ["Madrid", "Barcelona", "Valencia"]
    
    repeat {
        switch Bool.random() {
        case true where !leftValues.isEmpty:
            left.onNext("Left: " + leftValues.removeFirst())
        case false where !rightValues.isEmpty:
            right.onNext("Right: " + rightValues.removeFirst())
        default:
            break
        }
    } while !leftValues.isEmpty || rightValues.isEmpty
    left.onCompleted()
    right.onCompleted()
}

example(of: "combineLatest") {
    let left = PublishSubject<String>()
    let right = PublishSubject<String>()
    
    let observable = Observable.combineLatest(left, right) { lastLeft, lastRight in
        "\(lastLeft) \(lastRight)"
    }
    
    observable
        .subscribe(onNext: {
            print($0)
        })
    print("> Sending a value to Left")
    left.onNext("Hello,")
    print("> Sending a value to right")
    right.onNext("world")
    print("> Sending another value to Right")
    right.onNext("RxSwift")
    print("> Sending another value to Left")
    left.onNext("Have a nice day,")
    
    left.onCompleted()
    right.onCompleted()
}

example(of: "combine user choice and value") {
    let choice: Observable<DateFormatter.Style> = Observable.of(.short, .long)
    let dates = Observable.of(Date())
    
    let observable = Observable.combineLatest(choice, dates) { format, when -> String in
        let formatter = DateFormatter()
        formatter.dateStyle = format
        return formatter.string(from: when)
    }
    
    observable
        .subscribe(onNext: {
            print($0)
        })
}

example(of: "zip") {
    enum Weather {
        case cloudy
        case sunny
    }
    let left: Observable<Weather> = Observable.of(.sunny, .cloudy, .sunny, .cloudy, .cloudy)
    let right = Observable.of("Lisbon", "Copenhagen", "Belgrade", "London", "Madrid")
    
    let observable = Observable.zip(left, right) { weather, city in
        return "It's \(weather) in \(city)"
    }
    observable
        .subscribe(onNext: {
            print($0)
        })
}

example(of: "with latest from") {
    let button = PublishSubject<Void>()
    let textField = PublishSubject<String>()
    
    let observable = textField.sample(button)
    observable
        .subscribe(onNext: {
            print($0)
        })
    textField.onNext("Par")
    textField.onNext("Pari")
    textField.onNext("Paris")
    button.onNext(())
    button.onNext(())
}

example(of: "amb") {
    let left = PublishSubject<String>()
    let right = PublishSubject<String>()
    
    let observable = left.amb(right)
    
    observable
        .subscribe({
            print($0)
        })
    
    left.onNext("Lisbon")
    right.onNext("Copenhagen")
    left.onNext("Belgrade")
    left.onNext("Zagreb")
    right.onNext("Madrid")
    
    left.onCompleted()
    right.onCompleted()
}

example(of: "switchLatest") {
    let one = PublishSubject<String>()
    let two = PublishSubject<String>()
    let three = PublishSubject<String>()
    
    let source = PublishSubject<Observable<String>>()
    
    let observable = source.switchLatest()
    let disposable = observable
        .subscribe(onNext: {
            print($0)
        })
    
    source.onNext(one)
    one.onNext("Some text sequence one")
    two.onNext("Some text sequence two")
    
    source.onNext(two)
    two.onNext("More text from sequence two")
    one.onNext("More text from sequence one")
    
    source.onNext(three)
    two.onNext("Why dont you see me")
    one.onNext("I am lonely there")
    three.onNext("I am the king baby")
    
    source.onNext(one)
    one.onNext("Nope I win")
    
    disposable.dispose()
}

example(of: "reduce") {
    let source = Observable.of(1, 3, 5, 7, 9)
    
    let observable = source.reduce(0) { summary, newValue in
        return summary + newValue
    }
    observable
        .subscribe(onNext: {
            print($0)
        })
}

example(of: "scan") {
    let source = Observable.of(1, 2, 3, 4, 5)
    
    let observable = source.scan(0, accumulator: +)
    
    observable.subscribe(onNext: {
        print($0)
    })
}

//Challenges

example(of: "Challenge 1 - solution using zip") {
    let source = Observable.of(1, 3, 5, 7, 9)
    
    let scanObservable = source.scan(0, accumulator: +)
    let observable = Observable.zip(source, scanObservable)
    
    _ = observable.subscribe(onNext: { tuple in
        print("Value = \(tuple.0)   Running total = \(tuple.1)")
    })
}

example(of: "Challenge 1 - solution using just scan and a tuple") {
    let source = Observable.of(1, 3, 5, 7, 9)
    let observable = source.scan((0, 0)) { acc, current in
        return (current, acc.1 + current)
    }
    
    _ = observable.subscribe(onNext: { tuple in
        print("Value = \(tuple.0)   Running total = \(tuple.1)")
    })
}

/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

//MARK: - Again

example(of: "start with") {
    let numbers = Observable.of(2, 3, 4)
    
    let observable = numbers.startWith(1)
    observable.subscribe(onNext: {
        print($0)
    })
}

example(of: "observable concat") {
    let first = Observable.of(1, 2, 3)
    let second = Observable.of(4, 5, 6)
    
    let observable = Observable.concat(first, second)
    
    observable.subscribe(onNext: {
        print($0)
    })
}

example(of: "concat") {
    let germanCities = Observable.of("Berlin", "Munich", "Frankfurt")
    let spanishCities = Observable.of("Madrid", "Barcelona", "Valencia")
    
    let observabe = spanishCities.concat(germanCities)
    
    observabe.subscribe(onNext: {
        print($0)
    })
}

example(of: "concat map") {
    let sequences = [
        "German cities": Observable.of("Berlin", "Munich", "Frankfurt"),
        "Spanish cities": Observable.of("Madrid", "Barcelona", "Valencia")
    ]
    
    let observable = Observable.of("German cities", "Spanish cities")
        .concatMap { country in
            sequences[country] ?? .empty()
        }
    
    observable.subscribe(onNext: {
        print($0)
    })
}

example(of: "merge") {
    let left = PublishSubject<String>()
    let right = PublishSubject<String>()
    
    let source = Observable.of(left.asObservable(), right.asObservable())
    
    let observable = source.merge()
    observable.subscribe(onNext: {
        print($0)
    })
    
    var leftValues = ["Berlin", "Munich", "Frankfurt"]
    var rightValues = ["Madrid", "Barcelona", "Valencia"]
    
    repeat {
        switch Bool.random() {
        case true where !leftValues.isEmpty:
            left.onNext("Left:   " + leftValues.removeFirst())
        case false where !rightValues.isEmpty:
            right.onNext("Right:   " + rightValues.removeFirst())
        default:
            break
        }
    } while !leftValues.isEmpty || !rightValues.isEmpty
    
    left.onCompleted()
    right.onCompleted()
}

example(of: "combineLatest") {
    let left = PublishSubject<String>()
    let right = PublishSubject<String>()
    
    let observable = Observable.combineLatest(left, right) { lastLeft, lastRight in
        "\(lastLeft) \(lastRight)"
    }
    
    observable.subscribe(onNext: {
        print($0)
    })
    
    print("> Sending a value to Left")
    left.onNext("Hello,")
    print("> Sending a value to right")
    right.onNext("world")
    print("> Sending another value to Right")
    right.onNext("RxSwift")
    print("> Sending another value to Left")
    left.onNext("Have a nice day,")
    
    left.onCompleted()
    right.onCompleted()
}

example(of: "combine user choice and value") {
    let choice: Observable<DateFormatter.Style> = Observable.of(.short, .long)
    let dates = Observable.of(Date())
    
    let observable = Observable.combineLatest(choice, dates) { format, when -> String in
        let formatter = DateFormatter()
        formatter.dateStyle = format
        return formatter.string(from: when)
    }
    
    observable.subscribe(onNext: {
        print($0)
    })
}

example(of: "zip") {
    enum Weather {
        case clody, sunny
    }
    
    let left: Observable<Weather> = Observable.of(.sunny, .clody, .clody, .sunny)
    let right = Observable.of("Lisbon", "Beograd", "Zagreb", "Sabac")
    
    let observable = Observable.zip(left, right) { weather, city in
        return "It's \(weather) in \(city)"
    }
    observable.subscribe(onNext: {
        print($0)
    })
}

example(of: "with latest from") {
    let button = PublishSubject<Void>()
    let textField = PublishSubject<String>()
    
    let observable = textField.sample(button)
    observable.subscribe(onNext: {
        print($0)
    })
    
    textField.onNext("parada")
    textField.onNext("paradaj")
    textField.onNext("paradajz")
    button.onNext(())
    button.onNext(())
}

example(of: "amb") {
    let left = PublishSubject<String>()
    let right = PublishSubject<String>()
    
    let observable = left.amb(right)
    observable.subscribe(onNext: {
        print($0)
    })
    
    left.onNext("Lisbon")
    right.onNext("Copenhagen")
    left.onNext("London")
    left.onNext("Madrid")
    right.onNext("Vienna")
    
    left.onCompleted()
    right.onCompleted()
}

example(of: "switch latest") {
    let one = PublishSubject<String>()
    let two = PublishSubject<String>()
    let three = PublishSubject<String>()
    
    let source = PublishSubject<Observable<String>>()
    
    let observable = source.switchLatest()
    let diposable = observable.subscribe(onNext: {
        print($0)
    })
    
    source.onNext(one)
    one.onNext("Some text from sequence one")
    two.onNext("Some text from sequence two")
    
    source.onNext(two)
    two.onNext("More text from sequence two")
    one.onNext("and also from sequence one")
    
    source.onNext(three)
    two.onNext("Why don't you see me?")
    one.onNext("I'm alone, help me")
    three.onNext("Hey it's three. I win.")
    
    source.onNext(one)
    one.onNext("Nope. It's me, one!")
    
    diposable.dispose()
}

example(of: "reduce") {
    let source = Observable.of(1, 2, 3, 4)
    
    let observable = source.reduce(0) { summary, newValue in
        return summary + newValue
    }
    observable.subscribe(onNext: {
    print($0)})
}

example(of: "scan") {
    let source = Observable.of(1, 2, 3, 4)
    
    let observable = source.scan(0, accumulator: +)
    observable.subscribe(onNext: {
        print($0)
    })
}
