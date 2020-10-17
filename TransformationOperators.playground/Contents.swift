import Foundation
import Combine

// Collect ---> Array
["A", "B", "C", "D"].publisher.collect().sink { print($0) }
["A", "B", "C", "D", "E"].publisher.collect(3).sink { print($0) } // per 3

print()

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[123, 45, 67].publisher.map {
    formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
}.sink {
    print($0)
}

print()

struct Point {
    let x: Int
    let y: Int
}

let publisher = PassthroughSubject<Point, Never>()

publisher.map(\.x, \.y).sink { x, y in
    print("x is \(x), and y is \(y)")
}

publisher.send(Point(x: 10, y: 5))


