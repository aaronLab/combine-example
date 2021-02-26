import Foundation
import Combine

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[123, 241, 14, 255].publisher.map {
    formatter.string(from: NSNumber(value: $0)) ?? ""
}.sink { print($0) }
