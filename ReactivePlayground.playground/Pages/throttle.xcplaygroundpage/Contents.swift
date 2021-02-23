//: [Previous](@previous)
/*:
 ----
 ## `Filtering Operator: Throttle`
 
 `throttle` is a reactive operator that will filters out the data produced by an observable by emitting only the first and the last item (if specified) during a particular timespan.
 
 ----
 
 ![Throttle's Marble](throttleTrue.png)
 
 ----
 
 ![Throttle's Marble](throttleFalse.png)
*/

import Foundation
import RxSwift

/// Dispose Bag
var disposeBag = DisposeBag()

/// Observable of comments
let comments = Observable.of("firstComment", "secondComment", "thirdComment")

/// Apply `throttle` to the observable and subscribe to the result


//: [Next](@next)
