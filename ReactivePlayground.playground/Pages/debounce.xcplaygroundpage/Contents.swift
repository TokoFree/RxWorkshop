//: [Previous](@previous)
/*:
 ----
 ## `Filtering Operator: Debounce`
 
 `debounce` is a reactive operator that will filter out the data produced by an observable by emitting only the last item after a specific timespan has passed since the last emission.
 
 ----
 
 ![Debounce's Marble](debounce.png)
 
*/

import Foundation
import RxSwift

/// Dispose Bag
var disposeBag = DisposeBag()

/// Observable of search keywords
let keyword = Observable.of("k", "ko", "kop", "kopi")
    
/// Apply `debounce` to the observable and subscribe to the result


//: [Next](@next)
