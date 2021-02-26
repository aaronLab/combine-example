import Foundation
import Combine

let numbers = (1...50).publisher

numbers.sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })

numbers.ignoreOutput().sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })
