import Foundation
import Combine

let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<String, Never>()

publisher1.zip(publisher2)
    .sink {
        print("P1: \($0) / P2: \($1)")
}

publisher1.send(1)
publisher1.send(2)
publisher2.send("A")
publisher2.send("B")
publisher1.send(3)
publisher2.send("C")
publisher2.send("D")  // => Never Emitted

// => (1, A), (2, B), (3, C)
