import Foundation
import Combine

let publisher = ["A", "B", "C", "D"].publisher

publisher.count().sink {
    print($0)
}
