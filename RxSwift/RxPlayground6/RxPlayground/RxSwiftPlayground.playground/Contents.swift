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

example(of: "toArray") {
    let disposeBag = DisposeBag()
    
    Observable.of("A", "B", "C")
        .toArray()
        .subscribe(onSuccess: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "map") {
    let disposeBag = DisposeBag()
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    Observable<Int>.of(123, 4, 56)
        .map {
            formatter.string(for: $0) ?? ""
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "enumerated and map") {
    let disposeBag = DisposeBag()
    
    Observable.of(1, 2, 3, 4, 5, 6)
        .enumerated()
        .map { index, integer in
            index > 2 ? integer * 3 : integer
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "compactMap") {
    let disposeBag = DisposeBag()
    
    Observable.of("To", "be", nil, "or", "not", "to", "be", nil)
        .compactMap { $0 }
        .toArray()
        .map { $0.joined(separator: " ") }
        .subscribe(onSuccess: {
            print($0)
        })
        .disposed(by: disposeBag)
}

struct Student {
    let score: BehaviorSubject<Int>
}

example(of: "flatMap") {
    let disposeBag = DisposeBag()
    
    let laura = Student(score: BehaviorSubject(value: 80))
    let charlotte = Student(score: BehaviorSubject(value: 90))
    
    let student = PublishSubject<Student>()
    
    student
        .flatMap {
            $0.score
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    student.onNext(laura)
    laura.score.onNext(85)
    student.onNext(charlotte)
    laura.score.onNext(95)
    charlotte.score.onNext(100)
}

example(of: "flatMapLatest") {
    let disposeBag = DisposeBag()
    
    let laura = Student(score: BehaviorSubject(value: 80))
    let charlotte = Student(score: BehaviorSubject(value: 90))
    
    let student = PublishSubject<Student>()
    
    student
        .flatMapLatest {
            $0.score
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    student.onNext(laura)
    laura.score.onNext(85)
    student.onNext(charlotte)
    
    laura.score.onNext(95)
    charlotte.score.onNext(100)
    laura.score.onNext(105)
    charlotte.score.onNext(110)
    student.onNext(laura)
}

example(of: "materialize and dematerialize") {
    
    enum MyError: Error {
        case anError
    }
    
    let disposeBag = DisposeBag()
    
    let laura = Student(score: BehaviorSubject(value: 80))
    let charlotte = Student(score: BehaviorSubject(value: 90))
    
    let student = BehaviorSubject(value: laura)
    
    let studentScore = student
        .flatMapLatest {
            $0.score.materialize()
        }
    
    studentScore
        .filter {
            guard $0.error == nil else {
                print($0.error!)
                return false
            }
            return true
        }
        .dematerialize()
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    laura.score.onNext(85)
    laura.score.onError(MyError.anError)
    laura.score.onNext(90)
    student.onNext(charlotte)
}

example(of: "materialize and dematerialize") {
    enum MyError: Error {
        case anError
    }
    
    let disposeBag = DisposeBag()
    
    let laura = Student(score: BehaviorSubject(value: 80))
    let charlotte = Student(score: BehaviorSubject(value: 100))
    
    let student = BehaviorSubject(value: laura)
    
    let studentScore = student
        .flatMapLatest {
            $0.score.materialize()
        }
    
    studentScore
        .filter{
            guard $0.error == nil else {
                print($0.error!)
                return false
            }
            return true
            }
        .dematerialize()
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    laura.score.onNext(85)
    laura.score.onError(MyError.anError)
    laura.score.onNext(90)
    student.onNext(charlotte)
}

//MARK: - Challenges

/*example(of: "Challenge 1") {
  let disposeBag = DisposeBag()
  
  let contacts = [
    "603-555-1212": "Florent",
    "212-555-1212": "Shai",
    "408-555-1212": "Marin",
    "617-555-1212": "Scott"
  ]
  
  let convert: (String) -> Int? = { value in
    if let number = Int(value),
       number < 10 {
      return number
    }
    
    let keyMap: [String: Int] = [
      "abc": 2, "def": 3, "ghi": 4,
      "jkl": 5, "mno": 6, "pqrs": 7,
      "tuv": 8, "wxyz": 9
    ]
    
    let converted = keyMap
      .filter { $0.key.contains(value.lowercased()) }
      .map(\.value)
      .first
    
    return converted
  }
  
  let format: ([Int]) -> String = {
    var phone = $0.map(String.init).joined()
    
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
  
  let dial: (String) -> String = {
    if let contact = contacts[$0] {
      return "Dialing \(contact) (\($0))..."
    } else {
      return "Contact not found"
    }
  }
  
  let input = PublishSubject<String>()
  
  // Add your code here
  input.asObservable()
    .map(convert)
    .skipWhile { $0 == 0 }
    .take(10)
    .toArray()
    .map(format)
    .map(dial)
    .subscribe(onSuccess: {
      print($0)
    })
    .disposed(by: disposeBag)
  
  input.onNext("")
  input.onNext("0")
  input.onNext("408")
  
  input.onNext("6")
  input.onNext("")
  input.onNext("0")
  input.onNext("3")
  
  "JKL1A1B".forEach {
    input.onNext("\($0)")
  }
  
  input.onNext("9")
}
*/

//MARK: - Again

example(of: "to Array") {
    let diposeBag = DisposeBag()
    
    Observable.of("A", "B", "C")
        .toArray()
        .subscribe { strings in
            print(strings)
        } onError: { error in
            print(error)
        }
        .disposed(by: diposeBag)
}

example(of: "map") {
    let disposeBag = DisposeBag()
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    Observable<Int>.of(123, 23, 45)
        .map { intedzer in
            formatter.string(for: intedzer) ?? ""
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "enumerated and map") {
    let disposeBag = DisposeBag()
    
    Observable.of(1, 2, 3, 4, 5, 6)
        .enumerated()
        .map { index, integer in
            index > 2 ? integer * 2 : integer
        }
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "compactMap") {
    let disposeBag = DisposeBag()
    
    Observable.of("To", "Be", nil, "Or", "Not", nil, "To Be")
        .compactMap { $0 }
        .toArray()
        .map { string in
            string.joined(separator: " ")
        }
        .subscribe(onSuccess: {
            print($0)
        })
        .disposed(by: disposeBag)
}

example(of: "flatMap") {
    let disposeBag = DisposeBag()
    
    let laura = Student(score: BehaviorSubject(value: 80))
    let milena = Student(score: BehaviorSubject(value: 90))
    
    let student = PublishSubject<Student>()
    
    student
        .flatMap(\.score)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    student.onNext(laura)
    
    laura.score.onNext(85)
    
    student.onNext(milena)
    
    laura.score.onNext(95)
    
    milena.score.onNext(100)
}

example(of: "flatMapLatest") {
    let disposeBag = DisposeBag()
    
    let laura = Student(score: BehaviorSubject(value: 80))
    let konj = Student(score: BehaviorSubject(value: 90))
    
    let student = PublishSubject<Student>()
    
    student
        .flatMapLatest(\.score)
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    student.onNext(laura)
    laura.score.onNext(85)
    student.onNext(konj)
    
    laura.score.onNext(95)
    konj.score.onNext(100)
}

example(of: "Materialize and dematerialize") {
    enum MyError: Error {
        case anError
    }
    
    let disposeBag = DisposeBag()
    
    let laura = Student(score: BehaviorSubject(value: 80))
    let charlotte = Student(score: BehaviorSubject(value: 100))
    
    let student = BehaviorSubject(value: laura)
    
    let studentScore = student
        .flatMapLatest { $0.score.materialize() }
    
    studentScore
        .filter({
            guard $0.error == nil else { print($0.error!)
                return false
            }
            return true
        })
        .dematerialize()
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    
    laura.score.onNext(85)
    laura.score.onError(MyError.anError)
    laura.score.onNext(90)
    
    student.onNext(charlotte)
}
