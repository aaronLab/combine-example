//
//  Env.swift
//  News App
//
//  Created by Aaron Lee on 2020-11-20.
//

import Foundation

final class Env {
    
    func getAPIKey() -> String {
        let path = Bundle.main.path(forResource: "env", ofType: "txt")
        let apiKey = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        return apiKey ?? ""
    }
    
}
