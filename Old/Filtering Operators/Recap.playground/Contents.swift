import Foundation
import Combine

/*
 From 1 to 100
 
 1. Skip the first 50 values emitted by the upstream publisher.
 2. Take the next 20 values after those first 50 values.
 3. Only take even numbers
 
 The output of the result should produce the following number, one per line:
 52 54 46 48 60 62 64 66 68 70
 */

let numbers = (1...100).publisher

numbers.dropFirst(50).prefix(20).filter { $0 % 2 == 0 }.sink { print($0) }
