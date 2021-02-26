import UIKit
import Combine

class StringSubscriber: Subscriber {
    func receive(subscription: Subscription) {
        print("Received Subscription")
        subscription.request(.max(3))  // backpressure
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received Value", input)
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completed")
    }
    
    typealias Input = String
    typealias Failure = Never
    
}

class MyPublisher {
    let publisher = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"].publisher
    let subscriber = StringSubscriber()

    func main() {
        publisher.subscribe(subscriber)
    }
}

MyPublisher().main()

