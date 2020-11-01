//
//  APIError.swift
//  ToDos
//
//  Created by Aaron Lee on 2020-11-01.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
