//
//  APISession.swift
//  CombineWithNetworking
//
//  Created by Aaron Lee on 2020-10-22.
//

import Foundation
import Combine

struct APISession: APIService {
    func request<T>(with builder: RequestBuilder) -> AnyPublisher<T, APIError> where T: Decodable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys

        return URLSession.shared
            .dataTaskPublisher(for: builder.urlRequest)
            .receive(on: RunLoop.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, status -> AnyPublisher<T, APIError> in
                if let status = status as? HTTPURLResponse {
                    if (200...299).contains(status.statusCode) {
                        return Just(data)
                            .decode(type: T.self, decoder: decoder)
                            .mapError { _ in APIError.decodingError }
                            .eraseToAnyPublisher()
                    } else {
                        return Fail(error: APIError.httpError(status.statusCode))
                            .eraseToAnyPublisher()
                    }
                }
                return Fail(error: APIError.unknown)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }

}
