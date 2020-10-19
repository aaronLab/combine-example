//
//  ViewController.swift
//  Publishers
//
//  Created by Aaron Lee on 2020-10-19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notification = Notification.Name("Notification")
        
        let publisher = NotificationCenter.default.publisher(for: notification, object: nil)
        
        let subscription = publisher.sink { _ in
            print("Notification Received")
        }
        
        NotificationCenter.default.post(name: notification, object: nil)
        
        subscription.cancel()
        
    }


}

