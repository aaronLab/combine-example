//
//  ViewController.swift
//  WeatherApp
//
//  Created by Aaron Lee on 2020-10-17.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!

    private var webservice: Webservice = Webservice()
    private var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.temperatureLabel.text = "Loading..."

        self.cancellable = self.webservice.fetchWeather(city: "London")
            .catch { _ in Just(Weather.placeholder) }
            .map { weather in
                if let temp = weather.temp {
                    return "\(temp) ℃"
                }
                return "Error getting weather!"
            }.assign(to: \.text, on: temperatureLabel)
    }


}

