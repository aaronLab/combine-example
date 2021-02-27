//
//  main.swift
//  Subject
//
//  Created by Aaron Lee on 2021/02/27.
//

import Foundation
import Combine

let currentValueSubject = CurrentValueSubject<String, Never>("aaron")
let subscriber = currentValueSubject.sink { print($0) }

currentValueSubject.value = "Hello"
currentValueSubject.send("world")

let passthroughSubject = PassthroughSubject<String, Never>()
let subscriber2 = passthroughSubject.sink { print($0) }

passthroughSubject.send("passthroughsubject")
passthroughSubject.send("hi")

enum MyError: Error {
    case unknown
}

let passthroughSubject2 = PassthroughSubject<String, Error>()
let subscriber3 = passthroughSubject2.sink { result in
    switch result {
    case .failure(let error):
        print(error.localizedDescription)
    case .finished:
        print("finished")
        break
    }
} receiveValue: { value in
    print(value)
}

passthroughSubject2.send("Aaron")
passthroughSubject2.send("HI")

passthroughSubject2.send(completion: .finished)

passthroughSubject2.send("This will not work")
