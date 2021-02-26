import Foundation
import Combine

["A", "B", "C", "D", "E"].publisher.collect(3).sink {
    print($0)
}

// Collect is gonna give you the values inside of an "Array".
// The argument[Int] is gonna make the array "chuncked".
