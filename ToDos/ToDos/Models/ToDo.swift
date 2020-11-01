//
//  ToDo.swift
//  ToDos
//
//  Created by Aaron Lee on 2020-11-01.
//

import Foundation

struct ToDo: Decodable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
