//: [Previous](@previous)
/*:
 ----
 ## `Filtering Operator: Filter`
 
 `filter` is a reactive operator that will filters out the data emitted by an observable based on the condition provided in the closure inside the filter
 
 ----
 
 ![Filter's Marble](filter.png)
*/

import Foundation
import RxSwift

/// Dispose Bag
var disposeBag = DisposeBag()

/// Video Struct
struct VideoYoutube {
    let title: String
    let length: Int
}

/// Observable of videos uploaded
let video = Observable.of(
    VideoYoutube(title: "Unboxing iPhone baru", length: 12),
    VideoYoutube(title: "Jalan-jalan saat COVID", length: 5),
    VideoYoutube(title: "Review Makanan", length: 21)
)

/// Perform `Filter` to the observable and subscribe to the result


//: [Next](@next)
