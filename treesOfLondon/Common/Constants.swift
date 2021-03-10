//
//  Constants.swift
//  London Trees
//
//  Created by Andras Pal on 18/02/2021.
//  Copyright © 2021 Andras Pal. All rights reserved.
//

import Foundation
import UIKit

/// UI element size constants
enum kUI {
    
    enum ButtonDiameter {
        /// 68pt
        static let large: CGFloat = 68
        /// 62pt
        static let regular: CGFloat = 62
        /// 42pt
        static let small: CGFloat = 42
        /// 30pt
        static let extraSmall: CGFloat = 30
        /// 68pt
        static let largeSquare: CGSize = CGSize(width: kUI.ButtonDiameter.large, height: kUI.ButtonDiameter.large)
         /// 62pt
        static let regularSquare: CGSize = CGSize(width: kUI.ButtonDiameter.regular, height: kUI.ButtonDiameter.regular)
         /// 42pt
        static let smallSquare: CGSize = CGSize(width: kUI.ButtonDiameter.small, height: kUI.ButtonDiameter.small)
        /// 30pt
        static let extraSmallSquare: CGSize = CGSize(width: kUI.ButtonDiameter.extraSmall, height: kUI.ButtonDiameter.extraSmall)
    }
    
    enum IconSize {
        /// 30pt
        static let large: CGFloat = 80
        //// 18pt
        static let regular: CGFloat = 40
        /// 12pt
        static let small: CGFloat = 25
        /// 8pt
        static let extraSmall: CGFloat = 10
        /// 30pt
        static let largeSquare: CGSize = CGSize(width: kUI.IconSize.large, height: kUI.IconSize.large)
        /// 18pt
        static let regularSquare: CGSize = CGSize(width: kUI.IconSize.regular, height: kUI.IconSize.regular)
        /// 12pt
        static let smallSquare: CGSize = CGSize(width: kUI.IconSize.small, height: kUI.IconSize.small)
        /// 8pt
        static let extraSmallSquare: CGSize = CGSize(width: kUI.IconSize.extraSmall, height: kUI.IconSize.extraSmall)
    }

    enum Padding {
        static let screenTop: CGFloat = (UIDevice.hasNotch ? 40 : 20)
        static let screenBottom: CGFloat = (UIDevice.hasNotch ? 50 : 30)
        static let screenLeading: CGFloat = 25
        static let screenTrailing: CGFloat = 25
        static let screenHorizontal: CGFloat = 25
        static let labelEdge: CGFloat = 16
        static let loadingViewExtraPadding: CGFloat = (UIScreen.main.bounds.width > 370) ? 16 : 0
    }
    
    enum Spacing {
        static let titleToSubtitleLarge: CGFloat = 50
        static let titleToSubtitleSmall: CGFloat = 25
        static let titleToSubtitleTiny: CGFloat = 10
        static let buttonToButton: CGFloat = 10
        static let cellToCell: CGFloat = 8
        static let small: CGFloat = 5
        static let medium: CGFloat = 10
        static let large: CGFloat = 20
    }
    
    enum Size {
        static let regularFont: CGFloat = 16
        static let smallFont: CGFloat = 12
        static let cornerRadius: CGFloat = 10
        static let loadingViewHeight: CGFloat = 100
    }
    
    enum ZoomRange {
        static let small: Double = 400
        static let medium: Double = 800
        static let large: Double = 1600
        static let maxDistance: Double = 60000
    }
}

/// For setting up locations
enum kLocations {
    
    // Big Ben
    static let defaultLocation = (latitude: 51.5007, longitude: -0.1246)
}

/// Names of images included in the Assets
enum kImageName {
    static let test: String = "Test"
}
