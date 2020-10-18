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

let torontoUniv = School(name: "Toronto Univ.", noOfStudents: 124125)

let school = CurrentValueSubject<School, Never>(torontoUniv)

school
    .flatMap {
        $0.noOfStudents
    }
    .sink {
        print($0)
}

let woodbineUniv = School(name: "Woodbine Univ.", noOfStudents: 100)

school.value = woodbineUniv

torontoUniv.noOfStudents.value += 30000
woodbineUniv.noOfStudents.value += 10
