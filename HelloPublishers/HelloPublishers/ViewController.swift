//
//  ViewController.swift
//  HelloPublishers
//
//  Created by Aaron Lee on 2020-10-17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notification = Notification.Name("MyNotification")
        
        let publisher = NotificationCenter.default.publisher(for: notification, object: nil)
        
        let subscription = publisher.sink { _ in
            print("Notification Received")
        }
        
        NotificationCenter.default.post(name: notification, object: nil)
        
        subscription.cancel()
        
        NotificationCenter.default.post(name: notification, object: nil)
        
    }


}

