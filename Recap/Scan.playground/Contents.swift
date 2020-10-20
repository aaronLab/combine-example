import Foundation
import Combine

let publisher = (1...20).publisher

publisher.scan([0]) { (nums, value) -> [Int] in
    nums + [value]
}.sink {
    print($0)
}
