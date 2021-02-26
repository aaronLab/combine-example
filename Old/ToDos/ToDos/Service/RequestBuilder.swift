//
//  RequestBuilder.swift
//  ToDos
//
//  Created by Aaron Lee on 2020-11-01.
//

import Foundation

protocol RequestBuilder {
    var urlRequest: URLRequest { get }
}
