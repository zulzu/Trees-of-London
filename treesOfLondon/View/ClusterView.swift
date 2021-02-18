//
//  ClusterView.swift
//  treesOfLondon
//
//  Created by Andras Pal on 06/05/2020.
//  Copyright © 2020 Andras Pal. All rights reserved.
//


// This view is not really needed, could put the `clusteringIdentifier` to the `TreeMarkerView` and just delete this, but maybe it will come handy in the future for some updates
import Foundation
import MapKit

final class ClusterView: MKAnnotationView {
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        displayPriority = .defaultHigh
        
        clusteringIdentifier = "treeIcon"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
    }
}
