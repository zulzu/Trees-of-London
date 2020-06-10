//
//  TreeMarkerView.swift
//  treesOfLondon
//
//  Created by Andras Pal on 30/04/2020.
//  Copyright © 2020 Andras Pal. All rights reserved.
//

import Foundation
import MapKit


class TreeMarkerView: MKMarkerAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {


      guard let treeIcon = newValue as? Trees else {
        return
      }
      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        
        let treeImage = UIButton(frame: CGRect(
          origin: CGPoint.zero,
          size: CGSize(width: 100, height: 100)))
                
        //        treeImage.setBackgroundImage(#imageLiteral(resourceName: "Plane.jpg"), for: .normal)

        var treeIconCase = UIImage(named: "\(treeIcon.discipline ?? "defaultTree").jpg")
        treeImage.setBackgroundImage(treeIconCase, for: .normal)
        rightCalloutAccessoryView = treeImage
        

        
        let detailLabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.font = detailLabel.font.withSize(12)
        detailLabel.text = treeIcon.subtitle
        detailCalloutAccessoryView = detailLabel
        
      markerTintColor = treeIcon.markerTintColor
      if let letter = treeIcon.discipline?.first {
        glyphText = String(letter)
      }
        clusteringIdentifier = String(describing: ClusterView.self)
    }
  }
}


