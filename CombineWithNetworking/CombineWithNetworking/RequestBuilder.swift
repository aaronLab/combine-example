//
//  RequestBuilder.swift
//  CombineWithNetworking
//
//  Created by Aaron Lee on 2020-10-22.
//

import Foundation

protocol RequestBuilder {
    var urlRequest: URLRequest { get }
}
