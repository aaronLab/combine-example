//
//  MyAnotherSubscriber.swift
//  PublisherSubscriber
//
//  Created by Aaron Lee on 2021/02/26.
//

import Foundation
import Combine

final class MyAnotherSubscriber: Subscriber {
    
    typealias Input = String
    typealias Failure = Never
    
    var subscription: Subscription?
    
    /**
     Start to Subscribe
     */
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
        
        self.subscription = subscription
    }
    
    /**
     Got a value
     */
    func receive(_ input: String) -> Subscribers.Demand {
        switch input {
        case "Aaron":
            return .max(1)
        default:
            return .none
        }
    }
    
    /**
     Finished
     */
    func receive(completion: Subscribers.Completion<Never>) {
        
    }
    
}
