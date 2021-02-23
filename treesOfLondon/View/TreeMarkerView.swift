//
//  TreeMarkerView.swift
//  treesOfLondon
//
//  Created by Andras Pal on 30/04/2020.
//  Copyright © 2020 Andras Pal. All rights reserved.
//

import Foundation
import MapKit

/// The individual tree marker on the map. Has a callout with the name, the latin name and the leaf image.
class TreeMarkerView: MKMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let treeAnnotation = newValue as? Trees else {
                return
            }
            
            markerTintColor = treeAnnotation.markerTintColor
            canShowCallout = true
            
            if let letter = treeAnnotation.realTreeName.first {
                glyphText = String(letter)
            }
            
            treeAnnotation.title = treeAnnotation.realTreeName
            
            let treeImage = UIButton(frame: CGRect(
                                        origin: CGPoint.zero,
                                        size: kUI.IconSize.largeSquare))
            let treeIconCase = UIImage(named: "\(treeAnnotation.realTreeName).jpg")
            treeImage.setBackgroundImage(treeIconCase, for: .normal)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            rightCalloutAccessoryView = treeImage
            
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 0
            detailLabel.font = detailLabel.font.withSize(kUI.Size.smallFont)
            detailLabel.text = treeAnnotation.subtitle
            detailCalloutAccessoryView = detailLabel
            
            clusteringIdentifier = String(describing: ClusterView.self)
        }
    }
}
