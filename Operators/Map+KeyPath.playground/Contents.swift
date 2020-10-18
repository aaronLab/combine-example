import Foundation
import Combine

struct Point {
    let x: Int
    let y: Int
}

let publisher = PassthroughSubject<Point, Never>()

publisher.map(\.x, \.y).sink { x, y in
    print("x is \(x), y is \(y)")
}

publisher.send(Point(x: 20, y: 50))
