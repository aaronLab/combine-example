import Foundation
import Combine

let publisher = [2, 4, 6, 8, 10].publisher

publisher.allSatisfy { $0 % 2 == 0 }
    .sink {
        print($0)
}
