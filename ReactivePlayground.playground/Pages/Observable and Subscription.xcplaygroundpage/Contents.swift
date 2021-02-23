//: [Previous](@previous)

/*:
 ----
 ## `Observable and Subscription`
What's Observable?
 An observable represents a stream or source of data that can be observed over time for new data events.
 
 ----
 
What's Subscription?
 Subscriptions are what set everything in motion. When subscribing, observer handlers are needed to be supplied.
 
 ----
 ![observable's Marble](observable.png)
 
 */

import Foundation
import RxSwift

struct Video {
    let title: String
    var like: Int = 0
    var dislike: Int = 0
}

enum VideoError: Error {
    case emptyTitle
}

/// Create `observable`


/// Create `observer`
