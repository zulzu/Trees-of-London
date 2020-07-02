//
//  ClusterView.swift
//  treesOfLondon
//
//  Created by Andras Pal on 06/05/2020.
//  Copyright © 2020 Andras Pal. All rights reserved.
//

import Foundation
import MapKit

final class ClusterView: MKAnnotationView {
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        displayPriority = .defaultHigh
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    

    override func prepareForDisplay() {
        super.prepareForDisplay()

    }
    
}
