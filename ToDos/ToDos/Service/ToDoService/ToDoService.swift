//
//  ToDoService.swift
//  ToDos
//
//  Created by Aaron Lee on 2020-11-01.
//

import Foundation
import Combine

protocol ToDoService {

    var apiSession: APIService { get }


    func getToDoList() -> AnyPublisher<[ToDo], APIError>
}

extension ToDoService {

    func getToDoList() -> AnyPublisher<[ToDo], APIError> {

        return apiSession.request(with: ToDoEndPoint.getToDo)
            .eraseToAnyPublisher()

    }

}
