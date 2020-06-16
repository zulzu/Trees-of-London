//
//  Extensions.swift
//  London Trees
//
//  Created by Andras Pal on 15/06/2020.
//  Copyright © 2020 Andras Pal. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  func buttonShadow() {
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOffset = CGSize(width: -1, height: 2)
    self.layer.shadowRadius = 1.8
    self.layer.shadowOpacity = 0.3
  }
}
