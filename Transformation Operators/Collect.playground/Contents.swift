import Foundation
import Combine

["A", "B", "C", "D", "E"].publisher.collect(2).sink { print($0) }

// Collect => give you an array of elements
// Can chunk by an integer argument
