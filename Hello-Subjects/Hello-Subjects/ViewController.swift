//
//  ViewController.swift
//  Hello-Subjects
//
//  Created by Aaron Lee on 2020-10-17.
//

import UIKit
import Combine

enum MyError: Error {
    case subscriberError
}

class StringSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = MyError

    func receive(subscription: Subscription) {
        subscription.request(.max(2)) // 2 items
    }

    func receive(_ input: String) -> Subscribers.Demand {
        print(input)
        return .max(1)
    }

    func receive(completion: Subscribers.Completion<MyError>) {
        print("Completion")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /*
         Subjects have...
           -> Publisher
           -> Subscribers
         */
        let subscriber = StringSubscriber()

        let subject = PassthroughSubject<String, MyError>()

        subject.subscribe(subscriber)

        let subscription = subject.sink { completion in
            
            print("Received Completion from sink")
            
        } receiveValue: { value in

            print("Received Value from sink")
            
        }


        subject.send("A")
        subject.send("B")
        
        subscription.cancel()
        
        subject.send("C")
        subject.send("D")

    }


}

