import Foundation
import Combine

struct School {
    let name: String
    let noOfStudents: CurrentValueSubject<Int, Never>
    
    init(name: String, noOfStudents: Int) {
        self.name = name
        self.noOfStudents = CurrentValueSubject(noOfStudents)
    }
}

let cityschool = School(name: "City School", noOfStudents: 100)

let school = CurrentValueSubject<School, Never>(cityschool)

school.flatMap {
    $0.noOfStudents
}.sink {
    print($0)
}

let townSchool = School(name: "Town School", noOfStudents: 10)

school.value = townSchool

cityschool.noOfStudents.value += 100
townSchool.noOfStudents.value += 5
