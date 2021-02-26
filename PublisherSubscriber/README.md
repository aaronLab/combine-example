# Publisher & Subscriber

Publisher and Subscriber

- Pulbisher는 값을 expose
- Subscriber는 Publisher로 부터 값을 받는다


### Publisher

- 시간에 따라 값을 전송(Transmit)
- 하나 이상의 Subscriber 인스턴스에 Element를 제공

### [Convenience Publishers](https://developer.apple.com/documentation/combine)

> Future

- A publisher that eventually produces a single value and then finishes or fails.

> Just

- A publisher that emits an output to each subscriber just once, and then finishes.

> Deferred

- A publisher that awaits subscription before running the supplied closure to create a publisher for the new subscriber.

> Fail

- A publisher that immediately terminates with the specified error.

> Record

- A publisher that allows for recording a series of inputs and a completion, for later playback to each subscriber.

### [Sink](https://developer.apple.com/documentation/combine/publishers/merge6/sink(receivecompletion:receivevalue:))

- Publisher에 `sink` 메소드로 Subscriber 를 만든다.

- 그리고 Unlimited Num of Values를 요청한다.
