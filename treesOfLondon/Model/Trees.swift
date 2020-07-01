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
//    var title: String?
//    let locationName: String?
//    let discipline: String?
//    let coordinate: CLLocationCoordinate2D
    var title: String?
    let treeName: String?
    let fullLatinName: String?
    let coordinate: CLLocationCoordinate2D
    
    init(
        title: String?,
        treeName: String?,
        fullLatinName: String?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.treeName = treeName
        self.fullLatinName = fullLatinName
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
        treeName = properties["nm3"] as? String
        fullLatinName = properties["nm1"] as? String
        coordinate = point.coordinate
        super.init()
    }
    
//    var subtitle: String? {
//        return "\n" + "\n" + locationName! + "\n" + "\n" // + treeTestText
//    }
    
    var subtitle: String? {
        return latinName + "\n" + "\n" // + treeTestText
    }
    
    var latinName: String {
        if fullLatinName != nil {
            return fullLatinName!
        } else {
            return "unknown"
        }
    }
    

    var realTreeName: String {
        
        switch treeName {
        case "T01":
            return "Alder"
        case "T02":
            return "Apple"
        case "T03":
            return "Ash"
        case "T04":
            return "Beech"
        case "T05":
            return "Birch"
        case "T06":
            return "Black Locust"
        case "T07":
            return "Cherry"
        case "T08":
            return "Chestnut"
        case "T09":
            return "Cypress"
        case "T10":
            return "Elm"
        case "T11":
            return "Hawthorn"
        case "T12":
            return "Hazel"
        case "T13":
            return "Hornbeam"
        case "T14":
            return "Lime"
        case "T15":
            return "Maple"
        case "T16":
            return "Oak"
        case "T17":
            return "Other"
        case "T18":
            return "Pear"
        case "T19":
            return "Pine"
        case "T20":
            return "Plane"
        case "T21":
            return "Poplar"
        case "T22":
            return "Whitebeam"
        case "T23":
            return "Willow"
        default:
            return "Unknown"
        }
    }
    
    
    
    var markerTintColor: UIColor  {
        switch treeName {
        case "T01":
            return .init(red: 180/255, green: 218/255, blue: 0/255, alpha: 1.0)
        case "T02":
            return .init(red: 102/255, green: 141/255, blue: 56/255, alpha: 1.0)
        case "T03":
            return .init(red: 140/255, green: 152/255, blue: 97/255, alpha: 1.0)
        case "T04":
            return .init(red: 116/255, green: 218/255, blue: 48/255, alpha: 1.0)
        case "T05":
            return .init(red: 182/255, green: 192/255, blue: 185/255, alpha: 1.0)
        case "T06":
            return .init(red: 178/255, green: 174/255, blue: 114/255, alpha: 1.0)
        case "T07":
            return .init(red: 71/255, green: 153/255, blue: 85/255, alpha: 1.0)
        case "T08":
            return .init(red: 161/255, green: 140/255, blue: 91/255, alpha: 1.0)
        case "T09":
            return .init(red: 54/255, green: 114/255, blue: 15/255, alpha: 1.0)
        case "T10":
            return .init(red: 192/255, green: 210/255, blue: 139/255, alpha: 1.0)
        case "T11":
            return .init(red: 92/255, green: 111/255, blue: 70/255, alpha: 1.0)
        case "T12":
            return .init(red: 191/255, green: 168/255, blue: 37/255, alpha: 1.0)
        case "T13":
            return .init(red: 152/255, green: 192/255, blue: 92/255, alpha: 1.0)
        case "T14":
            return .init(red: 113/255, green: 166/255, blue: 115/255, alpha: 1.0)
        case "T15":
            return .init(red: 118/255, green: 195/255, blue: 105/255, alpha: 1.0)
        case "T16":
            return .init(red: 88/255, green: 107/255, blue: 16/255, alpha: 1.0)
        case "T17":
            return .init(red: 61/255, green: 132/255, blue: 131/255, alpha: 1.0)
        case "T18":
            return .init(red: 173/255, green: 174/255, blue: 43/255, alpha: 1.0)
        case "T19":
            return .init(red: 117/255, green: 153/255, blue: 137/255, alpha: 1.0)
        case "T20":
            return .init(red: 133/255, green: 164/255, blue: 89/255, alpha: 1.0)
        case "T21":
            return .init(red: 79/255, green: 151/255, blue: 120/255, alpha: 1.0)
        case "T22":
            return .init(red: 149/255, green: 227/255, blue: 136/255, alpha: 1.0)
        case "T23":
            return .init(red: 142/255, green: 187/255, blue: 151/255, alpha: 1.0)
        default:
            return .init(red: 17/255, green: 197/255, blue: 178/255, alpha: 1.0)
        }
    }
    
    
}

