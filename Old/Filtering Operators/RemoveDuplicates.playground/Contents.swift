import Foundation
import Combine

let words = "apple apple apple mango melon apple apple apple watermelon apple apple apple apple".components(separatedBy: " ").publisher

words
    .removeDuplicates()
    .sink { print($0) }

//Result
//apple
//mango
//melon
//apple
//watermelon
//apple
