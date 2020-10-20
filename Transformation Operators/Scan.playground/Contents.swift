import Foundation
import Combine

let publisher = (1...10).publisher

publisher.scan([]) { numbers, value -> [Int] in
    numbers + [value]
}.sink {
    print($0)
}

// Value comes from the range of the publisher
// The first argument of scan is the initial value
// And then return the type T in the closure
