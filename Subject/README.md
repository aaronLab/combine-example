# Subject

Outside Callers가 element를 publish 할 수 있는 방법을 제공하는 publisher

### Declaration

> protocol Subject : AnyObject, Publisher

### CurrentValueSubject

- 값이 변경될 때 마다 새 element를 publish함

- 가장 최근에 publish된 element 버퍼를 유지

- send 호출 시 현재 값도 업데이트 되므로 값을 직접 업데이트하는 것과 같음

- 초기 값을 줘야함

### PassthroughSubject

- downstream subscribers에 element를 broadcasts하는 subject

- 가장 최근 publish된 element의 초기값 또는 버퍼가 없음

- subscribers가 없거나 현재 demand가 0이면 value를 drop
