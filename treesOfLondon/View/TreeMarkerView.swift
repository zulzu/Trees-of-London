//
//  RapperService.swift
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


      markerTintColor = treeIcon.markerTintColor
      if let letter = treeIcon.discipline?.first {
        glyphText = String(letter)
      }
        clusteringIdentifier = String(describing: ClusterView.self)
    }
  }
}


