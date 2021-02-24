//
//  Extensions.swift
//  London Trees
//
//  Created by Andras Pal on 18/02/2021.
//  Copyright © 2021 Andras Pal. All rights reserved.
//

import Foundation
import UIKit

public extension UIDevice {
    
    static var hasNotch: Bool {
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0 > 20
    }
}

public extension UIScreen {
    
    static var height: CGFloat {
        UIScreen.main.bounds.size.height
    }

    static var width: CGFloat {
        UIScreen.main.bounds.size.width
    }
}

public extension UIWindow {

    /// Returns the key window for this application. Uses different APIs to get the key window depending on if the app is running on iOS 13 or 14+
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

extension UIView {
    
    func buttonShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: -1, height: 2)
        self.layer.shadowRadius = 1.8
        self.layer.shadowOpacity = 0.3
    }
}

extension UIView {
    
    func blink() {
        self.alpha = 0.2
        UIView.animate(withDuration: 1,
                       delay: 0.0,
                       options: [.curveLinear, .repeat, .autoreverse],
                       animations: { self.alpha = 1.0 },
                       completion: nil)
    }
}
