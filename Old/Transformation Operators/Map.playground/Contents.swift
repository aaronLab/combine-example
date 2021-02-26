import Foundation
import Combine

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[1, 25, 346, 32].publisher.map {
    formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
}.sink {
    print($0)
}

// Can use "map" as we used to use for "Array"
