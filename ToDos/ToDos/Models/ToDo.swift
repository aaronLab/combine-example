//
//  ToDo.swift
//  ToDos
//
//  Created by Aaron Lee on 2020-11-01.
//

import Foundation

struct ToDo: Decodable {
    let userId: Int
    let title: String
    let completed: Bool
}

extension ToDo: Identifiable {
    var id: UUID { return UUID() }
}
