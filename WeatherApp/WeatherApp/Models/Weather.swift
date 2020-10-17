//
//  Weather.swift
//  WeatherApp
//
//  Created by Aaron Lee on 2020-10-17.
//

import Foundation

struct WeatherResponse {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double?
    let humidity: Double?
    
    static var placeholder: Weather {
        return Weather(temp: nil, humidity: nil)
    }
}
