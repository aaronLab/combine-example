//
//  main.swift
//  PublisherSubscriber
//
//  Created by Aaron Lee on 2021/02/26.
//

import Foundation
import Combine

func lineBreak() {
    print("==============================")
    print()
}

let publisher1 = Just("Aaron")

let subscriber1 = publisher1.sink { value in
    print("subscriber1")
    print(value)
    lineBreak()
}

let subscriber2 = publisher1.sink { result in
    
    switch result {
    
    case .finished:
        print("Finished")
        lineBreak()
    case .failure(let error):
        print(error.localizedDescription)
    
    }
    
} receiveValue: { value in
    print("subscriber2")
    print(value)
}

publisher1.subscribe(MySubscriber())

lineBreak()

let publisher2 = ["Aaron", "Syeda", "KL", "Naya"].publisher

publisher2.subscribe(MySubscriber())

lineBreak()

let publisher3 = ["Aaron", "Syeda", "KL", "Naya", "Jesus"].publisher

publisher3.print().subscribe(MyAnotherSubscriber())

lineBreak()

let subject1 = PassthroughSubject<String, Never>()

let subscriber3 = MyAnotherSubscriber()

subject1.print().subscribe(subscriber3)
subject1.send("Aaron")
subject1.send("Syeda")
subject1.send("KL")
subject1.send("Naya")
subject1.send("Jesus")

lineBreak()

subscriber3.subscription?.request(.max(1))

print("subscription")

subject1.send("Aaron")

subject1.send(completion: .finished)

subject1.send("Syeda")
subject1.send("KL")
subject1.send("Naya")
subject1.send("Jesus")

lineBreak()
