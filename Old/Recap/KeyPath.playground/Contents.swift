import Foundation
import Combine

struct Point {
    let x: Int
    let y: Int
}

let subject = PassthroughSubject<Point, Never>()

subject.map(\.x, \.y).sink {
    print("x = \($0), y = \($1)")
}

subject.send(Point(x: 10, y: 20))
subject.send(Point(x: 10, y: 20))
subject.send(Point(x: 10, y: 20))
