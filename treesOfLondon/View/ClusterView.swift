//
//  ClusterView.swift
//  treesOfLondon
//
//  Created by Andras Pal on 06/05/2020.
//  Copyright © 2020 Andras Pal. All rights reserved.
//

import Foundation
import MapKit


//  MARK: Tree Cluster View
internal final class ClusterView: MKAnnotationView {
    
    internal override var annotation: MKAnnotation? { willSet { newValue.flatMap(configure(with:)) } }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        displayPriority = .defaultHigh
        collisionMode = .circle
        centerOffset = CGPoint(x: 0.0, y: -10.0)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("\(#function) not implemented.")
    }
}

//  MARK: Configuration
private extension ClusterView {
    func configure(with annotation: MKAnnotation) {
        guard let annotation = annotation as? MKClusterAnnotation else { return }
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 42.0, height: 42.0))
        let count = annotation.memberAnnotations.count
        image = renderer.image { _ in
            UIColor.init(red: 0/255, green: 190/255, blue: 197/255, alpha: 1.0).setFill()
            UIBezierPath(ovalIn: CGRect(x: 0.0, y: 0.0, width: 42.0, height: 42.0)).fill()
            
            UIColor.white.setFill()
            UIBezierPath(ovalIn: CGRect(x: 6.5, y: 6.5, width: 29.0, height: 29.0)).fill()
            let attributes = [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0/255, green: 65/255, blue: 65/255, alpha: 1.0), NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0)]
            let text = "\(count)"
            let size = text.size(withAttributes: attributes)
            let rect = CGRect(x: 21.0 - size.width / 2, y: 21.0 - size.height / 2, width: size.width, height: size.height)
            text.draw(in: rect, withAttributes: attributes)
        }
        
    }
}

