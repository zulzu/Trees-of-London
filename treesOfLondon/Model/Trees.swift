//
//  Trees.swift
//  treesOfLondon
//
//  Created by Andras Pal on 14/04/2020.
//  Copyright © 2020 Andras Pal. All rights reserved.
//

import Foundation
import MapKit

class Trees: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let discipline: String?
    let coordinate: CLLocationCoordinate2D
    
    init(
        title: String?,
        locationName: String?,
        discipline: String?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    init?(feature: MKGeoJSONFeature) {
        // 1
        guard
            let point = feature.geometry.first as? MKPointAnnotation,
            let propertiesData = feature.properties,
            let json = try? JSONSerialization.jsonObject(with: propertiesData),
            let properties = json as? [String: Any]
            else {
                return nil
        }
        
        // 3
        title = properties["nm3"] as? String
        locationName = properties["nm1"] as? String
        discipline = properties["nm3"] as? String
        coordinate = point.coordinate
        super.init()
    }
    
    var treeTestText = "The London plane is a large deciduous tree growing 20–30 m (66–98 ft), exceptionally over 40 m (131 ft) tall, with a trunk up to 3 m (10 ft) or more in circumference. The bark is usually pale grey-green, smooth and exfoliating, or buff-brown and not exfoliating. The leaves are thick and stiff-textured, broad, palmately lobed, superficially maple-like, the leaf blade 10–20 cm (4–8 in) long and 12–25 cm (5–10 in) broad, with a petiole 3–10 cm (1–4 in) long. The young leaves in spring are coated with minute, fine, stiff hairs at first, but these wear off and by late summer the leaves are hairless or nearly so. The flowers are borne in one to three (most often two) dense spherical inflorescences on a pendulous stem, with male and female flowers on separate stems."
    
//    var markerTreeIcon: UIImage {
//        switch discipline {
//        case "Plane":
//            return .
//        }
//    }
    
    
    var subtitle: String? {
        return "\n" + "\n" + locationName! + "\n" + "\n" // + treeTestText
    }
    
    
    var markerTintColor: UIColor  {
        switch discipline {
        case "Alder":
            return .cyan
        case "Apple":
            return .systemPink
        case "Ash":
            return .systemPink
        case "Beech":
            return .systemPink
        case "Birch":
            return .systemPink
        case "Black Locust":
            return .systemPink
        case "Cherry":
            return .systemPink
        case "Chestnut":
            return .systemPink
        case "Cypress":
            return .systemPink
        case "Elm":
            return .systemPink
        case "Hawthorn":
            return .systemPink
        case "Hazel":
            return .systemPink
        case "Hornbeam":
            return .systemPink
        case "Lime":
            return .systemPink
        case "Maple":
            return .systemPink
        case "Oak":
            return .blue
        case "Other":
            return .yellow
        case "Pear":
            return .systemPink
        case "Pine":
            return .systemPink
        case "Plane":
            return .systemPink
        case "Poplar":
            return .systemPink
        case "Whitebeam":
            return .systemPink
        case "Willow":
            return .systemPink
        default:
            return .green
        }
    }
    
    
}

