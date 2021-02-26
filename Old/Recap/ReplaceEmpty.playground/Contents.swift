import Foundation
import Combine

let empty = Empty<Int, Error>()

empty.replaceEmpty(with: 1)
    .sink(receiveCompletion: { _ in print("WOW") }, receiveValue: { print($0) })
