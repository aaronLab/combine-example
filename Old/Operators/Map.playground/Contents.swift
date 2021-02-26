import Foundation
import Combine

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[123, 45, 6789].publisher.map {
    formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
}.sink {
    print($0)
}
