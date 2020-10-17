import Foundation
import Combine

/*
 collect
 */
["A", "B", "C", "D"].publisher.collect().sink { print($0) }
["A", "B", "C", "D", "E"].publisher.collect(3).sink { print($0) } // per 3

print()

/*
 map
 */
let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[123, 45, 67].publisher.map {
    formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
}.sink {
    print($0)
}

print()

/*
 map KeyPath
 */
struct Point {
    let x: Int
    let y: Int
}

let publisher = PassthroughSubject<Point, Never>()

publisher.map(\.x, \.y).sink { x, y in
    print("x is \(x), and y is \(y)")
}

publisher.send(Point(x: 10, y: 5))

print()

/*
 flatmap
 */
struct School {
    let name: String
    let noOfStudents: CurrentValueSubject<Int, Never>
    
    init(name: String, noOfStudents: Int) {
        self.name = name
        self.noOfStudents = CurrentValueSubject(noOfStudents)
    }
}

let citySchool = School(name: "Toronto Univ.", noOfStudents: 12345)

let school = CurrentValueSubject<School, Never>(citySchool)

school
    .flatMap { $0.noOfStudents }
    .sink { print($0) }

let townSchool = School(name: "Woodbine School", noOfStudents: 80)

school.value = townSchool

citySchool.noOfStudents.value += 20000
townSchool.noOfStudents.value += 10
