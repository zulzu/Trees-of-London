//
//  ClusterView.swift
//  treesOfLondon
//
//  Created by Andras Pal on 06/05/2020.
//  Copyright © 2020 Andras Pal. All rights reserved.
//

import Foundation
import MapKit

/// The cluster view of the trees
final class ClusterView: MKMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            
            canShowCallout = false
            markerTintColor = UIColor.unknown
            clusteringIdentifier = "treeIcon"
        }
    }
}
