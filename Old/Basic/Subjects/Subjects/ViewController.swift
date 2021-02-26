//
//  ViewController.swift
//  Subjects
//
//  Created by Aaron Lee on 2020-10-19.
//

import UIKit
import Combine

enum MyError: Error {
    case subscriberError
}

class StringSubscriber: Subscriber {
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        .none
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
        print("Completed")
    }
    
    typealias Input = String
    
    typealias Failure = MyError
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subject = PassthroughSubject<String, MyError>()
        let subscriber = StringSubscriber()
        
        subject.subscribe(subscriber)
        
        let subscription = subject.sink(receiveCompletion: { _ in }, receiveValue: { print($0)})
        
        subject.send("A")
        subject.send("B")
        
        subscription.cancel()
        
        subject.send("C")
        subject.send("D")
        
        
    }


}

