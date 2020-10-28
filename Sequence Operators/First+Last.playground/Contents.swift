import Foundation
import Combine

let publisher = ["A", "B", "C", "D"].publisher

publisher.first().sink {
    print($0)
}

publisher.first(where: { "CEO".contains($0) })
    .sink {
        print($0)
}

publisher.last().sink {
    print($0)
}

publisher.last(where: { "Candy".contains($0) })
    .sink {
        print($0)
    }
