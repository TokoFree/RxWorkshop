//: [Previous](@previous)
/*:
 ----
 ## `Combination Operator: Zip`
 
 `zip` is a reactive operator that combined multiple events together and emits single events based on the combined results.
 
 This operator will only emit event if and only if all combined events emit the event (In other words, it will only emit events on per-pair basis) In addition to that, zip operator can also combine events that have different data types
 
 ----
 
 ![Zip's Marble](zip.png)
*/


import Foundation
import RxSwift

/// Dispose Bag
var disposeBag = DisposeBag()

/// A property to keep track of the rewind year
var year: Int = 2020

/// Let's say that these 6 videos want to be published at the same time
let radityaDika = Observable.of("Raditya: Video 2020", "Raditya: Video 2021")
let raffiAhmad = Observable.of("Raffi: Video 2020", "Raffi: Video 2021")
let corbuzier = Observable.of("Corbuzier: Video 2020", "Corbuzier: Video 2021")

/// `Zip` the three observables and subscribe to the result


//: [Next](@next)
