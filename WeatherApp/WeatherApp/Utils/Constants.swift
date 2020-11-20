//
//  Constants.swift
//  WeatherApp
//
//  Created by Aaron Lee on 2020-10-17.
//

import Foundation

struct Constants {
    
    struct URLs {
        
        static func weather(city: String) -> String {
            return "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=1d608e7c427c5ef6792c3bd9269d5c51&units=metric"
        }
        
    }
    
}
