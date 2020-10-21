import Foundation
import Combine

let numbers = (1...10).publisher

numbers.prefix(8).sink { print ($0) }

numbers.prefix(while: { $0 < 7 }).sink { print($0) }
