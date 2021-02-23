[Session 1 - Introduction to RxSwift](#session-1---introduction-to-rxswift)
- [What's Reactive Programming?](#whats-reactive-programming)
- [What's Observable?](#observable)
- [What's Stream?](#stream)
- [What's Observer?](#observer)
- [What's Subscription?](#subscription)
- [What's DisposeBag?](#whats-disposebag)

[Session 2 - Getting to know RxSwift Operator](#session-2---introduction-to-reactive-operator)
- Creating Operators
    - [just](#just)
    - [of](#of)
    - [from](#from)
- Transforming Operator
    - [map](#map)
- Combining Operators
    - [combineLatest](#combinelatest)
    - [merge](#merge)
    - [zip](#zip)
- Filtering Operators
    - [filter](#filter)
    - [throttle](#throttle)
    - [debounce](#debounce)

#  Session 1 - Introduction to RxSwift
RxSwift is one of the reactive frameworks that pretty popular among swift developers, 
In this section, we will get to know how this framework works.

#### What's Reactive Programming?
A programming paradigm that mainly focuses on asynchronous data streams and change of events.

#### Example of Reactive Programming in Real World
<img width="300" alt="map" src="https://lh5.googleusercontent.com/Pndmfx8SRYYbwmibH5FJs_zo-AaBkqd1GC3RMhzs2blySLcRPNPwxu5LFVn6QcSMmmvqryG8tMIntfeezePAdoJavPA7jzL4F44kAUqg">

> a Spreadsheet/Ms. Excel is one of the example on the reactive programming, why?
> If you ever creating a sum operation inside the table of the spreadsheet
> that's one of the example of reactive programming world.
> let's say you have a value of 1 and 2 inside the row A1, and A2,
> then you create a formula of `sum(A1:A2)` on the row A3.
> when you click enter, the value on the row A3 should be `3`, because `1 + 2 = 3`.
> then what happen if you try to change the value on the row A2 to become 5??
> now automatically the value on the A3 should become `6`, why?
> Because you just change the input with the new value, and the row A3, will reactively listen to that changes.
> Got it?

The above example will be easy to be created with reactive programming, but it will be such a hassle if you want to create those things in imperative programming.

## Terminologies in RxSwift

#### Observable
`An observable represents a stream or source of data that can be observed over time for new data events.`

<img width="300" alt="map" src="https://lh5.googleusercontent.com/QTTnzVTnUEos6wpxGzAR9-h6IHEacHMO_0JGGzyLEqcmwdJYSS0mMPFMiYKxMFWdoSMczkS-Fx0bdyD4Y8Y5jL3G2w0DdUxf2YgtpYpDeRg34xCPt2IIqttZ48FnMOzrq_eHKMFw_M0">

>To make it easier to remember, we can assume that observable is like a YouTuber, 
as a YouTuber whenever we have a newly uploaded video, we can give a notification to all of our subscribers, and that's process is quite the same as what Observable did, whenever there is a change, the observable will send the notification to the observers.

#### Stream
`A continuous sequence of data that can be consumed by others.`

<img width="300" alt="map" src="https://lh4.googleusercontent.com/QEbHwVqWcw_WWU_QowQovHtiibQuoaRM_swhyTb8OMQLsZ1DdZ0eX8ysU5JVYpgGq_XnYaevdm5pHzix6s3NLGSTx40o07079TI2gKU_">

>After we talk about Observable, the next term we should know is Stream, if we get back to the analogy of YouTubers, we can assume that Stream is some kind of process that happened when we sending some notification once we have uploaded a new video.

#### Observer
`Observers listen to the data stream emitted by the observable.`

<img width="300" alt="map" src="https://lh3.googleusercontent.com/erN1Mqm5vspbvP4Bt9FASubNSCvOkdrlSCq7tWelyq91rfm7Dr0r-KnRxbWjdqHdcTRxFjKT28rJ1UV98HN9lzeZRedTfGUfhN6DIDZRgd9Ge-SexGZXVHI1_Q6Yr7ttYvyN0IM88aU">

>The next important term of the reactive things is Observers, this term could be easy to remember if we still using the YouTubers analogy, we can assume that observers are like the subscribers of YouTube's channel, as the subscriber we can define our desired action when one of our favorite channels is uploading a new video and sending us a notification, we can directly watch it, or we also can add that new video into our watch later list.

#### Subscription
`Subscriptions are what set everything in motion. When subscribing, observer handlers are needed to be supplied.`

<img width="300" alt="map" src="https://lh5.googleusercontent.com/rv2aw9sBr4Mb-Mrt8bs-dXiuGElImiJFnaktfGfTKUt0GklOHjqZWHDxurV5C8UaJwvJ4qaZUdN4E61224oZpsUDKm_c1Oyd-Pm3ImDd">

>Last but not least, the subscription is the most important thing of this reactive terminology, with the subscription we can get the latest data and can reactively do what we want when the data has come. If we continuing our YouTuber's analogy, we can imagine that `Subscription` is the completed set of the process from the Observable, Stream, & Observers. If we see the above image when the YouTuber's upload a new video, we can send a notification to the subscribers, and the subscribers will have their defined action, someone is will directly watch the new video, and the other one will add the video to his watch later list, and every time this process is running, we can call it the subscription process.

#### Error Notification:
<img width="300" alt="map" src="https://lh5.googleusercontent.com/3JjCbvU2ZIaobJnCiBlzO1iBYHEsN9yjAaoLxaUnRX6MutAdDW-GQRqJ8K-MdZSFnsX_8hczSg6T6UjmNx-AxuTRC-IOipgUI38UxLuX">

#### Completed Notification
<img width="300" alt="map" src="https://lh5.googleusercontent.com/gdu5NQMrzBmNVwhSF7EU26o3GHzKso7Gdr21UuDOr1cRfIIIRX--d5SXujCDWdHY3TID0xsHZhluyd-gbmyyjR38i6DDeJcA2XbIb4zf">

>However, the observable isn't just giving a positive event, it also can send an error & a completed notification.

#### Show me the Code

```swift
struct Video {
    let title: String
    var like: Int = 0
    var dislike: Int = 0
}

enum VideoError: Error {
    case emptyTitle
}

let attaHalilintar = Observable<Video>.create { observer -> Disposable in
    let videos: [Video] = [
        .init(title: "Video 1"),
        .init(title: "Video 2"),
        .init(title: ""),
        .init(title: "Video 3")
    ]
    
    videos.forEach { video in
        if video.title.isEmpty {
            observer.on(.error(VideoError.emptyTitle))
            return
        }
        
        if video.title == "Video 3" {
            observer.on(.next(video))
            observer.on(.completed)
            return
        }
        
        observer.on(.next(video))
        return
    }
    
    return Disposables.create()
}

let surya = attaHalilintar.subscribe { _ in
    print("Watching Now!!")
} onError: {
    print($0,"<< error")
} onCompleted: {
    print("<< completed")
} onDisposed: {
    print("<< disposed")
}

let ditha = attaHalilintar.subscribe { _ in
    print("Set Reminder for Tomorrow")
} onError: {
    print($0,"<< error")
} onCompleted: {
    print("<< completed")
} onDisposed: {
    print("<< disposed")
}

surya.dispose()
ditha.dispose()
```

# What's DisposeBag?
DisposeBag is a class that created to help us to hold all of our subscription.

Usage of DisposeBag:
- Used to avoid memory leaks as the subscription will not be disposed of correctly without.
- DisposeBag holds `disposables`.
- DisposeBag allows us not to have to dispose of each subscription individually.

```swift
let disposeBag = DisposeBag()

Observable.of("Chris Sutton", "Henrik Larsson", "Bobo Balde")
	.subscribe {
		print($0)
	}
	.disposed(by: disposeBag)
````

- We can manually cause an observable to terminate by cancelling the subscription to it (Not recommended - should use disposeBag above).

```swift
subscription.dispose()
```

#  Session 2 - Introduction to Reactive Operator
Now let’s go beyond basics on this section and talk about the next most important component of RxSwift, Operators.
We use operators in order to help us in performing various actions to our observables. Operators are divided into several categories based on the functionalities, which are :
- Creation Operator: of, just, from
- Transformation Operator: map
- Combination Operator: merge, combineLatest, zip
- Filtering Operator: filter, throttle, debounce

#### just
This operator will only emit a single value, with respecting of the defined generic type.

```swift
Observable.just("Video 1")
```

#### of
This operator will emit multiples value, base on defined generic type.

```swift
Observable.of("Video 1", "Video 2", "Video 3")
```

#### from
This operator worked like an `of` operator, but the one that make diferrence is this operator only accept an array value.

```swift
Observable.from([“Video 1”, “Video 2”, “Video 3”])
```

#### map
The `map` is an operator that will modify each item produced by an observable, then will further emit the transformed values. The modification is described on the closure of this operator.

<img width="600" alt="map" src="https://user-images.githubusercontent.com/50097952/107806430-711bc000-6d99-11eb-8e8b-8302305b9af5.png">

>Example case:
Altering your YouTube titles into more clickbait titles.

```swift
var disposeBag = DisposeBag()

let titles = Observable<String>.from([
    "Video Lucu",
    "Video Unboxing",
    "Video Mukbang"
]).map { videoTitle -> String in
    return "LUAR BIASA! Anda tidak akan percaya kalau tidak nonton habis \(videoTitle) ini..."
}

titles.subscribe { videoTitle in
    print("\(videoTitle) <<< Click this video")
} onError: { error in
    print("\(error) <<< error")
} onCompleted: {
    print("Completed")
} onDisposed: {
    print("Disposed")
}
.disposed(by: disposeBag)
```

#### combineLatest
combineLatest is an operator that we want to use when a value depends on the combination of more than 1 Observables. 
This operator will emit an item whenever any of the source observables emits an item (as long as each of the source Observables has emitted at least one item).

![combineLatest](https://user-images.githubusercontent.com/17472033/107462719-52e27400-6b8f-11eb-876f-626f4ebd81ca.png)

Analogy: As we all know, Tokopedia conducts WIB TV Show every month. Let's say that to start the WIB TV Show, Tokopedia needs 2 artists from Korea and Indonesia 
respectively. Initially, Tokopedia selects BTS as part of the Korean performer. However, since the Indonesian artist hasn't been determined, WIB TV Show can't be
started. Next, Tokopedia selects Wali as the Indonesian performer. Since both artists have been determined, Tokopedia will start their first TV show with BTS and 
Wali as the guest stars. Suddenly, Tokopedia decides to change their Korean performer from BTS to BlackPink. Since both artists also have been determined, 
Tokopedia will start their second WIB TV Show with BlackPink and Wali as the performers. The same also occurs when Tokopedia decides to change the Indonesian
artist from Wali to ST12. Tokopedia will start their third WIB TV Show with BlackPink and ST12 as the guest stars, and so on.


```swift
var wibSession: Int = 1

let koreanArtist = Observable<String>.from(["BTS", "BlackPink", "Twice"])
    .with(interval: .seconds(3))
    .do(onNext: {
        print("New Korean Artist: ", $0)
    })

let indonesianArtist = Observable<String>.from(["Wali", "ST12", "Raisa"])
    .with(interval: .seconds(5))
    .do(onNext: {
        print("New Indonesian Artist: ", $0)
    })

Observable.combineLatest(koreanArtist, indonesianArtist)
    .subscribe { koreanArtist, indonesianArtist in
        print("\n>>>>> WIB-\(wibSession): \(koreanArtist) & \(indonesianArtist)\n")
        wibSession += 1
    } onError: {
        print("There's an error on WIB, with Error: ", $0)
    } onCompleted: {
        print("Completed")
    } onDisposed: {
        print("Disposed")
    }
    .disposed(by: disposeBag)
 
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
```

#### merge
Merge is an reactive operator to combine several observables of the same type so they act like a single observable.

![image](https://user-images.githubusercontent.com/17718188/107911758-be618280-6f8f-11eb-8170-760fcd7940c8.png)

Analogy: Let's say Tokopedia want to advertise a WIB event on its channel. Tokopedia needs 2 influencer to contribute for the ads, Atta and Kekeyi. Each influencer should make several videos about the WIB event and then submit it to be shared on Tokopedia channel. In this case, Atta and Kekeyi do not depend on each other, so Tokopedia doesn't need to wait all influencer to submit their videos. In other words, Tokopedia will dierectly post the video to the channel every time the influencer submit their video.

```swift
Let disposeBag = DisposedBag()

let atta = Observable.of("video atta 1", "video atta 2")

let kekeyi = Observable.of("video kekeyi 1")
        
Observable
    .merge(atta, kekeyi)
    .subscribe(onNext: { video in
        print("Tokopedia Publish \(video)")
    }).disposed(by: disposeBag)

```

#### zip
Zip is an reactive operator that combined multiple events together and emits single events based on the combined results
This operator will only emit event if and only if all combined events emit the event (In other words, it will only emit events on per-pair basis)
In addition to that, zip operator can also combine events that have different data types


For visualization purpose, let's take a look at this RxMarbles below, in this section you can see that Tokopedia has collaborated and decided to publish the rewind video of 3 famous youtubers: Raditya Dika, Raffi Ahmad, and Deddy Corbuzier. But since it's a rewind video, the condition is that all the videos must be published at the same time. Each of these youtubers may make and finish their videos sooner or later than others. But Tokopedia cannot publish the rewind videos before all youtubers have finished their videos. Therefore, the event will only be emitted when all videos are finished.


![zip](https://user-images.githubusercontent.com/17472037/108207844-db967c80-715a-11eb-9359-72ceb8830e47.png)


```swift
var disposeBag = DisposeBag()
var year: Int = 2020

// Let's say that these 6 videos want to be published at the same time
let radityaDika = Observable.of("Raditya: Video 2020", "Raditya: Video 2021")
let raffiAhmad = Observable.of("Raffi: Video 2020", "Raffi: Video 2021")
let corbuzier = Observable.of("Corbuzier: Video 2020", "Corbuzier: Video 2021")

Observable.zip(
    radityaDika,
    raffiAhmad,
    corbuzier
).subscribe(
    onNext: { videos in
        print(">>>>>tokopedia rewind \(year): ", videos)
        year += 1
    },
    onError: { error in
        print(">>>>>rewind error", error.localizedDescription)
    },
    onCompleted: {
        print(">>>>>rewind complete")
    },
    onDisposed: {
        print(">>>>>disposed")
    }
)
```

#### filter
Filter is a reactive operator that will filters out the data emitted by an observable based on the condition provided in the closure inside the filter.

Assuming we have a list of videos in our channel. However, due to the regulations from Youtube, only videos with length more than 8 minutes will be able to receive
incentives from the advertisement. With the filter operator, we will be able to filter out the videos that will be able to receive the advertisement fee. 

![filter](https://user-images.githubusercontent.com/17472033/108252329-16b0a400-718b-11eb-8c93-763e2d813e33.png)

```swift
var disposeBag = DisposeBag()

struct VideoYoutube {
    let title: String
    let length: Int
}

let video = Observable.of(
    VideoYoutube(title: "Unboxing iPhone baru", length: 12),
    VideoYoutube(title: "Jalan-jalan saat COVID", length: 5),
    VideoYoutube(title: "Review Makanan", length: 21)
)

video
    .filter { $0.length >= 8 }
    .subscribe(onNext: { video in
        print(">>> Dapat ads revenue untuk video: \(video.title)")
    })
    .disposed(by: disposeBag)
```

#### throttle

throttle is a reactive operator that will filters out the data produced by an observable by emitting only the first and the last item (if specified) during a 
particular timespan.

For example, when we're commenting a live video in Youtube, we are not allowed to spam the comment section with our comments (even though we are so hapy to do
so). Youtube has a rule that if we submit multiple comments in 1 second, only the first and the last comment will be delivered, and this is how throttle operator 
works.

![throttleTrue](https://user-images.githubusercontent.com/17472033/108252906-c128c700-718b-11eb-9f7e-77cb8fb92097.png)

However, if Youtube wants to, they also can just allow users to submit only the first comment within 1 second, and ignore the last comment. This is an analogy,
of using the throttle operator while setting the latest boolean to false.

![throttleFalse](https://user-images.githubusercontent.com/17472033/108253177-12d15180-718c-11eb-970a-93c3765321b8.png)

```swift
let disposeBag = DisposeBag()

let comments = Observable.of("firstComment", "secondComment", "thirdComment")

comments
    .throttle(.seconds(1), latest: true, scheduler: MainScheduler.instance)
    .subscribe(onNext: { (comment: String) in
        print(">>> Incoming comment: \(comment)")
    })
    .disposed(by: disposeBag)
```

#### debounce

debounce is a reactive operator that will filters out the data produced by an observable by emitting only the last item after a specific timespan has passed since the last emission.

When we usually search for something, we will type a keyword as fast as we can within a specific time range. For example, when we want to search for `kopi`, in 1 second, we will type the letters `k`, `o`, `p`, and `i`. However, to save some processes, we don't want to search for `k`, `ko`, or `kop` since the one that we're searching for is `kopi`. In this case, we're implementing the debounce operator, in which we will only get the latest keyword typed in a spefic time range.

![debounce](https://user-images.githubusercontent.com/17472033/108621937-54058200-7468-11eb-9a94-7c723b8ea2bd.png)

```swift
var disposeBag = DisposeBag()

let keyword = Observable.of("k", "ko", "kop", "kopi")

keyword
    .debounce(.seconds(1), scheduler: MainScheduler.instance)
    .subscribe(onNext: { (comment: String) in
        print(">>> Typed keyword: \(comment)")
    })
    .disposed(by: disposeBag)
```
