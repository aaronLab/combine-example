import Foundation
import Combine

let publisher = [1, -45, 45, 100, -100].publisher

publisher
    .min()
    .sink {
        print($0)
    }

publisher
    .max()
    .sink {
        print($0)
    }
