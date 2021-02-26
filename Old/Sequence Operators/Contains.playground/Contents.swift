import Foundation
import Combine

let publisher = ["A", "B", "C", "D"].publisher

publisher.contains("B")
    .sink {
        print($0)
}
