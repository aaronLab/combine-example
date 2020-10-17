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
    @IBOutlet weak var cityTextField: UITextField!

    private var webservice: Webservice = Webservice()
    private var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.temperatureLabel.text = "Waiting..."

        setupPublishers()
    }

    private func setupPublishers() {

        let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self.cityTextField)

        self.cancellable = publisher.compactMap {
            ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        }.debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .flatMap { city in
                return self.webservice.fetchWeather(city: city)
                    .catch { _ in Just(Weather.placeholder) }
                    .map { $0 }
            }.sink {
                if let temp = $0.temp {
                    self.temperatureLabel.text = "\(temp) ℃"
                } else {
                    self.temperatureLabel.text = "No Information"
                }
            }

    }


}

