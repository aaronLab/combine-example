import Foundation
import Combine

let publisher = ["A", "B", "C", "D"].publisher

publisher.output(at: 2)
    .sink {
        print($0)
}

publisher.output(in: 0...3)
    .sink {
        print($0)
    }
