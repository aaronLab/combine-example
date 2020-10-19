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
        
        let center = NotificationCenter.default
        
        let observer = center.addObserver(forName: notification, object: nil, queue: nil) { notification in
            print("Notification Received")
        }
        
        center.post(name: notification, object: nil)
        
        center.removeObserver(observer)
        
    }


}

