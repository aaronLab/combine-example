import Foundation
import Combine

let numbers = (1...10).publisher

numbers.dropFirst(7).sink { print($0) }
