//
//  main.swift
//  Cancellable
//
//  Created by Aaron Lee on 2021/02/27.
//

import Foundation
import Combine

let subject1 = PassthroughSubject<Int, Never>()

let subscriber1 = subject1.sink { print($0) }

subject1.send(1)
subscriber1.cancel()
subject1.send(2)

var bag = Set<AnyCancellable>()

let subject2 = PassthroughSubject<Int, Never>()

subject2
    .sink { print($0) }
    .store(in: &bag)
