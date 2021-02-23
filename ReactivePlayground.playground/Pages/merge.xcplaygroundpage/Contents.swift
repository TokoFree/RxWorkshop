//: [Previous](@previous)
/*:
 ----
 ## `Combination Operator: Merge`
 
 `merge` is a reactive operator to combine several observables of the same type so they act like a single observable.
 
 ----
 
 ![Merge's Marble](merge.png)
*/

import Foundation
import RxSwift

/// Dispose Bag
var disposeBag = DisposeBag()

/// Observable of videos uploaded by Atta
let atta = Observable.of("video atta 1", "video atta 2")

/// Observable of videos uploaded by Kekeyi
let kekeyi = Observable.of("video kekeyi 1")
        
/// `Merge` the two observables and subscribe to the result


//: [Next](@next)
