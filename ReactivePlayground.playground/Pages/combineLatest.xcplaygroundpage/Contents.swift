//: [Previous](@previous)
/*:
 ----
 ## `Combination Operator: CombineLatest`
 
 `combineLatest` is an operator that we want to use when a value depends on the combination of more than 1 Observables.
 
 This operator will emit an item whenever any of the source observables emits an item (as long as each of the source Observables has emitted at least one item).
 
 ----
 
 ![CombineLatest's Marble](combineLatest.png)
*/

import Foundation
import RxSwift

/// Dispose Bag
var disposeBag = DisposeBag()

/// Counter to keep track of current WIB session
var wibSession: Int = 1
        
/// List of Korean artists that will perform in WIB
let koreanArtist = Observable<String>.from(["BTS", "BlackPink", "Twice"])
    .with(interval: .seconds(3))
    .debug("Korean artist ", trimOutput: true)

/// List of Indonesian artists that will perform in WIB
let indonesianArtist = Observable<String>.from(["Wali", "ST12", "Raisa"])
    .with(interval: .seconds(5))
    .debug("Indonesian artist ", trimOutput: true)

/// Combining two observables with `combineLatest` operator and subscribe to the result



/// Extension to delay the observable emission
extension Observable {
    func with(interval: RxTimeInterval) -> Observable {
        return enumerated()
            .concatMap { _, element in
                Observable
                    .just(element)
                    .delay(interval, scheduler: MainScheduler.instance)
            }
    }
}

//: [Next](@next)
