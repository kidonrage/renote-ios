//
//  Extensions+UINavigationController.swift
//  ReNote
//
//  Created by Vlad Eliseev on 30.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

extension UIViewController {
    public func presentAlertNotification(title: String, message: String?, completionHandler: (()->Void)? = nil) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(
            UIAlertAction(title: "OK", style: .default, handler: nil)
        )
        self.present(ac, animated: true, completion: completionHandler)
    }
}
