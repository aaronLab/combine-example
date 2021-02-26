import Foundation
import Combine

["A", "B", "C", "D"].publisher.collect(2).sink { print($0) }
