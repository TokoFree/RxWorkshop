//: [Previous](@previous)
/*:
 ----
 ## `Transformation Operator: Map`
 
 `map` is an operator that will modify each item produced by an observable, then will further emit the transformed values.
 
 The modification is described on the closure of this operator.
 
 ----
 
 ![Map's Marble](map.png)
*/

import Foundation
import RxSwift

/// Dispose Bag
var disposeBag = DisposeBag()

/// List of video titles
let titles = Observable<String>.from([
    "Video Lucu",
    "Video Unboxing",
    "Video Mukbang"
])

/// Subscribe process of `titles` observable

//: [Next](@next)
