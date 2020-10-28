import Foundation
import Combine

let publisher = ["A", "B", "C", "D"].publisher
let publisher2 = PassthroughSubject<Int, Never>()

publisher.count().sink {
    print($0)
}

publisher2.count()
    .sink {
        print($0)
    }

publisher2.send(10)
publisher2.send(10)
publisher2.send(10)
publisher2.send(10)
publisher2.send(10)
publisher2.send(completion: .finished)
