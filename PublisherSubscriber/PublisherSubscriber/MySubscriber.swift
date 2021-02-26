//
//  MySubscriber.swift
//  PublisherSubscriber
//
//  Created by Aaron Lee on 2021/02/26.
//

import Foundation
import Combine

final class MySubscriber: Subscriber {
    
    typealias Input = String
    typealias Failure = Never
    
    /**
     unlimited: 무제한
     max: 갯수 재한
     none: max(0), no elements
     */
    func receive(subscription: Subscription) {
        print("start to subscribe")
        subscription.request(.max(2))
    }
    
    /**
     값을 받았을 때
     */
    func receive(_ input: String) -> Subscribers.Demand {
        print("from input: \(input)")
        return .none
    }
    
    /*
     완료되었을 때
     */
    func receive(completion: Subscribers.Completion<Never>) {
        print("finished subscribing", completion)
    }
    
}
