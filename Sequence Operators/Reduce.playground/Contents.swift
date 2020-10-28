import Foundation
import Combine

let publisher = [1, 2, 3, 4, 5, 6].publisher

publisher.reduce(0) { 
    print("accumulator: \($0), value: \($1)")
    return $0 + $1
}.sink {
    print($0)
}
