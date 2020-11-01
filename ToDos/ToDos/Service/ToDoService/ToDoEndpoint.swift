//
//  ToDoEndpoint.swift
//  ToDos
//
//  Created by Aaron Lee on 2020-11-01.
//

import Foundation

enum ToDoEndPoint {
    case getToDo
}

extension ToDoEndPoint: RequestBuilder {

    var urlRequest: URLRequest {
        switch self {
        case .getToDo:

            guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/") else { preconditionFailure("Invalid URL") }
            
            
            return URLRequest(url: url)

        }
    }

}
