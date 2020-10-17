import Foundation
import Combine

// Collect ---> Array
["A", "B", "C", "D"].publisher.collect().sink { print($0) }
["A", "B", "C", "D", "E"].publisher.collect(3).sink { print($0) } // per 3


let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[123, 45, 67].publisher.map {
    formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
}.sink {
    print($0)
}
