import Foundation
import Combine

let numbers = (1...10).publisher
let numbers2 = (15...20).publisher

numbers.append(11, 12)
    .append(13, 14)
    .append([30, 50])
    .append(numbers2)
    .sink {
    print($0)
}
