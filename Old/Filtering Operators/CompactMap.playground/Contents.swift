import Foundation
import Combine

let strings = ["A", "5,5", "B", "3.3", "F", "6.7", "5.124125"].publisher
    .compactMap{ Float($0) }.sink { print($0) }
