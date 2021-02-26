import UIKit
import Combine

// Understanding Publisher & Subscriber
let notification = Notification.Name("My Notification")

let publisher = NotificationCenter.default.publisher(for: notification)

let subscription = publisher.sink { _ in print("Notification Received") }

NotificationCenter.default.post(name: notification, object: nil)
subscription.cancel()
NotificationCenter.default.post(name: notification, object: nil)

enum MyError: Error {
    case subscriberError
}

class StringSubscriber: Subscriber {
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        return .none
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
        print("Completed!")
    }
    
    typealias Input = String
    
    typealias Failure = MyError
}

let subject = PassthroughSubject<String, MyError>()
let subscriber = StringSubscriber()
subject.subscribe(subscriber)
subject.subscribe(subscriber)
let subscription2 = subject.sink(receiveCompletion: { _ in }, receiveValue: { print($0) })
subject.send("A")
subject.send("B")
subscription2.cancel()
subject.send("C")
