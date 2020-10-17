import Foundation
import Combine

let publisher = PassthroughSubject<Int, Never>().eraseToAnyPublisher()  // PassthroughSubject ---> AnyPublisher

publisher.send // ---> Error
