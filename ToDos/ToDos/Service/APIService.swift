//
//  APIService.swift
//  ToDos
//
//  Created by Aaron Lee on 2020-11-01.
//

import Foundation
import Combine

protocol APIService {
    
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
    
}
