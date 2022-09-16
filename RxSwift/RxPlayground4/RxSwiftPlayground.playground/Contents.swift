import Foundation
import RxSwift



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

example(of: "ignoreElements") {
    let strikes = PublishSubject<String>()
    let disposeBag = DisposeBag()
    
    strikes
        .ignoreElements()
        .subscribe { _ in
            print("You are out!")
        }
        .disposed(by: disposeBag)
    
    strikes.onNext("X")
    strikes.onNext("X")
    strikes.onNext("X")
    strikes.onCompleted()
}

example(of: "elementAt") {
    let strikes = PublishSubject<String>()
    let disposeBag = DisposeBag()
    
    strikes
        .elementAt(2)
        .subscribe(onNext: { _ in
            print("You are out!")
        })
        .disposed(by: disposeBag)
    
    strikes.onNext("X")
    strikes.onNext("X")
    strikes.onNext("X")
}

example(of: "filter") {
    let disposeBag = DisposeBag()
    
    Observable.of(1,2,3,4,5,6)
        .filter {
            $0.isMultiple(of: 2)
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "Skip") {
    let disposeBag = DisposeBag()
    
    Observable.of("A", "B", "C", "D", "E", "F")
        .skip(3)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "skipWhile") {
    let disposeBag = DisposeBag()
    
    Observable.of(426, 8, 6, 4, 2, 2, 3, 2, 2, 4)
        .skipWhile {
            $0.isMultiple(of: 2)
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "skipUntil") {
    let disposeBag = DisposeBag()
    
    let subject = PublishSubject<String>()
    let trigger = PublishSubject<String>()
    
    subject
        .skipUntil(trigger)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    subject.onNext("A")
    trigger.onNext("X")
    subject.onNext("B")
    subject.onNext("C")
}

example(of: "take") {
    let disposeBag = DisposeBag()
    
    Observable.of(1,2,3,4,5,6)
        .take(3)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "takeWhile") {
    let disposeBag = DisposeBag()
    
    Observable.of(2, 2, 4, 4, 6, 6)
        .enumerated()
        .takeWhile { index, integer in
            integer.isMultiple(of: 2) && index < 3
        }
        .map(\.element)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "takeUntil") {
    let disposeBag = DisposeBag()
    
    Observable.of(1,2,3,4,5)
        .takeUntil(.exclusive) {
            $0.isMultiple(of: 5)
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "takeUntil trigger") {
    let disposeBag = DisposeBag()
    
    let subject = PublishSubject<String>()
    let trigger = PublishSubject<String>()
    
    subject
        .takeUntil(trigger)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    subject.onNext("1")
    subject.onNext("2")
    trigger.onNext("X")
    subject.onNext("3")
}

example(of: "distinctUntilChanged") {
    let disposeBag = DisposeBag()
    
    Observable.of("A", "A", "B", "B", "A", "A")
        .distinctUntilChanged()
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "distinctUntilChanged(_:)") {
    let disposeBag = DisposeBag()
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    Observable<NSNumber>.of(10,110,20,200,210,310)
        .distinctUntilChanged { a, b in
            guard
                let aWords = formatter
                    .string(from: a)?
                    .components(separatedBy: " "),
            let bWords = formatter
                .string(from: b)?
                .components(separatedBy: " ")
            else {
                return false
            }
            
            var containsMatch = false
            for aWord in aWords where bWords.contains(aWord) {
                containsMatch = true
                break
            }
            return containsMatch
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

//MARK: - Challenges

example(of: "Challenge 1") {
  let disposeBag = DisposeBag()
  
  let contacts = [
    "603-555-1212": "Florent",
    "212-555-1212": "Shai",
    "408-555-1212": "Marin",
    "617-555-1212": "Scott"
  ]
  
  func phoneNumber(from inputs: [Int]) -> String {
    var phone = inputs.map(String.init).joined()
    
    phone.insert("-", at: phone.index(
      phone.startIndex,
      offsetBy: 3)
    )
    
    phone.insert("-", at: phone.index(
      phone.startIndex,
      offsetBy: 7)
    )
    
    return phone
  }
  
  let input = PublishSubject<Int>()
  
  // Add your code here
  input
    .skipWhile { $0 == 0 }
    .filter { $0 < 10 }
    .take(10)
    .toArray()
    .subscribe(onSuccess: {
      let phone = phoneNumber(from: $0)
      
      if let contact = contacts[phone] {
        print("Dialing \(contact) (\(phone))...")
      } else {
        print("Contact not found")
      }
    })
    .disposed(by: disposeBag)
  
  input.onNext(0)
  input.onNext(603)
  
  input.onNext(2)
  input.onNext(1)
  
  // Confirm that 7 results in "Contact not found",
  // and then change to 2 and confirm that Shai is found
  input.onNext(2)
  
  "5551212".forEach {
    if let number = (Int("\($0)")) {
      input.onNext(number)
    }
  }
  
  input.onNext(9)
}


let numbers = Observable<Int>.create { observer in
    let start = getStartNumber()
    observer.onNext(start)
    observer.onNext(start + 1)
    observer.onNext(start + 2)
    observer.onCompleted()
    return Disposables.create()
}

var start = 0

func getStartNumber() -> Int {
    start += 1
    return start
}

numbers
    .subscribe(
        onNext: { el in
            print("element [\(el)]")
        },
        onCompleted: {
            print("-----------")
        })

numbers
    .subscribe(
        onNext: { el in
            print("element [\(el)]")
        },
        onCompleted: {
            print("-----------")
        })

numbers
    .subscribe(
        onNext: { el in
            print("element [\(el)]")
        },
        onCompleted: {
            print("-----------")
        })

example(of: "distinctUntilChanged func") {
    let disposeBag = DisposeBag()
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    Observable<NSNumber>.of(10, 110, 20, 220, 200, 210, 310)
        .distinctUntilChanged { a, b in
            guard
                let aWords = formatter
                    .string(from: a)?
                    .components(separatedBy: " "),
                let bWords = formatter
                    .string(from: b)?
                    .components(separatedBy: " ")
            else {
                return false
            }
            
            var containsMatch = false
            
            for aWord in aWords where bWords.contains(aWord) {
                containsMatch = true
                break
            }
            
            return containsMatch
        }
        .map {
            formatter.string(for: $0) ?? ""
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

//MARK: - Again 2

example(of: "ignore Elements") {
    let strikes = PublishSubject<String>()
    let disposeBag = DisposeBag()
    
    strikes
        .ignoreElements()
        .subscribe { _ in
            print("you are out")
        }
        .disposed(by: disposeBag)
    
    strikes.onNext("Kupus")
    strikes.onNext("Kupus")
    strikes.onNext("Kupus")

    strikes.onCompleted()
}

example(of: "element At") {
    let strikes = PublishSubject<String>()
    let disposeBag = DisposeBag()
    
    strikes
        .elementAt(2)
        .subscribe(onNext: { _ in
            print("You are out")
        })
        .disposed(by: disposeBag)
    
    strikes.onNext("Goal")
    strikes.onNext("Goal")
    strikes.onNext("Goal")
    strikes.onNext("Goal")
    strikes.onNext("Goal")
}

example(of: "filter") {
    let diposeBag = DisposeBag()
    
    Observable.of(1, 2, 3, 4, 5, 6, 7)
        .filter { number in
            number.isMultiple(of: 3)
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: diposeBag)
}

example(of: "skip") {
    let disposeBag = DisposeBag()
    
    Observable.of("A", "B", "C", "D", "E")
        .skip(3)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "skip While") {
    let disposeBag = DisposeBag()
    
    Observable.of(2, 2, 3, 4, 4)
        .skipWhile { number in
            number.isMultiple(of: 2)
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "skip Until") {
    let disposeBag = DisposeBag()
    
    let subject = PublishSubject<String>()
    let trigger = PublishSubject<String>()
    
    subject
        .skipUntil(trigger)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    subject.onNext("1")
    subject.onNext("2")
    
    trigger.onNext("X")
    
    subject.onNext("3")
    subject.onNext("4")
}

example(of: "take") {
    let disposeBag = DisposeBag()
    
    Observable.of(1, 2, 3, 4, 5, 6)
        .take(2)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "take while") {
    let disposeBag = DisposeBag()
    
    Observable.of(2, 2, 4, 4, 6, 6)
        .enumerated()
        .takeWhile { index, integer in
            integer.isMultiple(of: 2) && index < 3
        }
        .map(\.element)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "take until") {
    let diposeBag = DisposeBag()
    
    Observable.of(1, 2, 3, 4, 5, 6)
        .takeUntil(.inclusive) { $0.isMultiple(of: 4) }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: diposeBag)
}

example(of: "take until, trigger") {
    let disposeBag = DisposeBag()
    
    let subject = PublishSubject<String>()
    let trigger = PublishSubject<String>()
    
    subject
        .takeUntil(trigger)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    subject.onNext("1")
    subject.onNext("2")
    subject.onNext("3")
    
    trigger.onNext("X")
    
    subject.onNext("$")
}

example(of: "distinctUntilChanged") {
    let disposeBag = DisposeBag()
    
    Observable.of("A", "A", "A", "B", "B", "B", "C", "D", "A")
        .distinctUntilChanged()
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "distinctUntilChanged(_)") {
    let disposeBag = DisposeBag()
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    Observable<NSNumber>.of(10, 110, 20, 220, 200, 210, 300)
        .distinctUntilChanged { a, b in
            guard let aWords = formatter
                .string(from: a)?
                .components(separatedBy: " "),
            let bWords = formatter
                .string(from: b)?
                .components(separatedBy: " ")
            else { return false }
            var containsMatch = false
            
            for aWord in aWords where bWords.contains(aWord) {
                containsMatch = true
                break
            }
            
            return containsMatch
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}
