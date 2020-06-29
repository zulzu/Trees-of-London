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
    var title: String?
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
    
    var realTitle: String {
        return "testTitle"
    }
    
//    var subtitle: String? {
//        return "\n" + "\n" + locationName! + "\n" + "\n" // + treeTestText
//    }
    
    var subtitle: String? {
        return latinName + "\n" + "\n" // + treeTestText
    }
    
    var latinName: String {
        if locationName != nil {
            return locationName!
        } else {
            return "testName"
        }
    }
    
    var lineBrake: String {
        "\n" + "\n"
    }
    
    var realTreeName: String {
        
        switch discipline {
        case "t01":
            return "Alder"
        case "t02":
            return "Apple"
        case "t03":
            return "Ash"
        case "t04":
            return "Beech"
        case "t05":
            return "Birch"
        case "t06":
            return "Black Locust"
        case "t07":
            return "Cherry"
        case "t08":
            return "Chestnut"
        case "t09":
            return "Cypress"
        case "t10":
            return "Elm"
        case "t11":
            return "Hawthorn"
        case "t12":
            return "Hazel"
        case "t13":
            return "Hornbeam"
        case "t14":
            return "Lime"
        case "t15":
            return "Maple"
        case "t16":
            return "Oak"
        case "t17":
            return "Other"
        case "t18":
            return "Pear"
        case "t19":
            return "Pine"
        case "t20":
            return "Plane"
        case "t21":
            return "Poplar"
        case "t22":
            return "Whitebeam"
        case "t23":
            return "Willow"
        default:
            return "Unknown"
        }
    }
    
    
    
    var markerTintColor: UIColor  {
        switch discipline {
        case "t01":
            return .init(red: 180/255, green: 218/255, blue: 0/255, alpha: 1.0)
        case "t02":
            return .init(red: 102/255, green: 141/255, blue: 56/255, alpha: 1.0)
        case "t03":
            return .init(red: 140/255, green: 152/255, blue: 97/255, alpha: 1.0)
        case "t04":
            return .init(red: 116/255, green: 218/255, blue: 48/255, alpha: 1.0)
        case "t05":
            return .init(red: 182/255, green: 192/255, blue: 185/255, alpha: 1.0)
        case "t06":
            return .init(red: 178/255, green: 174/255, blue: 114/255, alpha: 1.0)
        case "t07":
            return .init(red: 71/255, green: 153/255, blue: 85/255, alpha: 1.0)
        case "t08":
            return .init(red: 161/255, green: 140/255, blue: 91/255, alpha: 1.0)
        case "t09":
            return .init(red: 54/255, green: 114/255, blue: 15/255, alpha: 1.0)
        case "t10":
            return .init(red: 192/255, green: 210/255, blue: 139/255, alpha: 1.0)
        case "t11":
            return .init(red: 92/255, green: 111/255, blue: 70/255, alpha: 1.0)
        case "t12":
            return .init(red: 191/255, green: 168/255, blue: 37/255, alpha: 1.0)
        case "t13":
            return .init(red: 152/255, green: 192/255, blue: 92/255, alpha: 1.0)
        case "t14":
            return .init(red: 113/255, green: 166/255, blue: 115/255, alpha: 1.0)
        case "t15":
            return .init(red: 118/255, green: 195/255, blue: 105/255, alpha: 1.0)
        case "t16":
            return .init(red: 88/255, green: 107/255, blue: 16/255, alpha: 1.0)
        case "t17":
            return .init(red: 61/255, green: 132/255, blue: 131/255, alpha: 1.0)
        case "t18":
            return .init(red: 173/255, green: 174/255, blue: 43/255, alpha: 1.0)
        case "t19":
            return .init(red: 117/255, green: 153/255, blue: 137/255, alpha: 1.0)
        case "t20":
            return .init(red: 133/255, green: 164/255, blue: 89/255, alpha: 1.0)
        case "t21":
            return .init(red: 79/255, green: 151/255, blue: 120/255, alpha: 1.0)
        case "t22":
            return .init(red: 149/255, green: 227/255, blue: 136/255, alpha: 1.0)
        case "t23":
            return .init(red: 142/255, green: 187/255, blue: 151/255, alpha: 1.0)
        default:
            return .init(red: 17/255, green: 197/255, blue: 178/255, alpha: 1.0)
        }
    }
    
    
}

