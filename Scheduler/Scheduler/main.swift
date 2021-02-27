//
//  main.swift
//  Scheduler
//
//  Created by Aaron Lee on 2021/02/27.
//

import Foundation
import Combine

let subject1 = PassthroughSubject<Int, Never>()

let subscriber1 = subject1.sink { _ in print(Thread.isMainThread) }

subject1.send(1) // true

let subject2 = PassthroughSubject<Int, Never>()

let subscriber2 = subject2.sink { _ in print(Thread.isMainThread) }

subject2.send(1) //true

DispatchQueue.global().async {
    subject2.send(2) // false
}

let publisher1 = ["Zedd"].publisher

let subscriber3 = publisher1
    .map { _ in print("map1 \(Thread.isMainThread)") } // true
//    .receive(on: DispatchQueue.global())
    .receive(on: DispatchQueue.main)
    .map { print("map2 \(Thread.isMainThread)") } // false
    .sink { print("sink \(Thread.isMainThread)") } // false

let publisher2 = CurrentValueSubject<String, Never>("Aaron")

let subscriber4 = publisher2
    .subscribe(on: DispatchQueue.global())
    .sink { _ in print("Sink: \(Thread.isMainThread)") }
