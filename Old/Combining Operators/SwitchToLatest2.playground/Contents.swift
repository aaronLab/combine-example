import UIKit
import Combine

let images = ["1", "2", "3"]
var index = 0

func getImage() -> AnyPublisher<UIImage?, Never> {

    return Future<UIImage?, Never> { promise in

        DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
            promise(.success(UIImage(named: "\(images[index]).jpg")))
        }

    }.print().map { $0 }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()

}

let taps = PassthroughSubject<Void, Never>()

let subscription = taps.map { _ in getImage() }
    .print()
    .switchToLatest().sink {
        print($0 as Any)
}

// 1
taps.send()


// 2
DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
    index += 1
    taps.send()
}


// 3
DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
    index += 1
    taps.send()
}

