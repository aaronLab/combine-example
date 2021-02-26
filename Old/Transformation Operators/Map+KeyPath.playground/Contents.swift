import Foundation
import Combine

struct Point {
    let x: Int
    let y: Int
}

let publisher = PassthroughSubject<Point, Never>()

publisher.map(\.x, \.y).sink {
    print("x is \($0), y is \($1)")
}

publisher.send(Point(x: 10, y: 20))

// by using PassthroughSubject, can "Map" with keyPath
