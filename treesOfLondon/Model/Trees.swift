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
        
        guard
            let point = feature.geometry.first as? MKPointAnnotation,
            let propertiesData = feature.properties,
            let json = try? JSONSerialization.jsonObject(with: propertiesData),
            let properties = json as? [String: Any]
            else {
                return nil
        }
        
        title = properties["nm3"] as? String
        treeName = properties["nm3"] as? String
        fullLatinName = properties["nm1"] as? String
        coordinate = point.coordinate
        super.init()
    }
    
    var subtitle: String? {
        return latinName + "\n" + "\n" 
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
            return .alder
        case "T02":
            return .apple
        case "T03":
            return .ash
        case "T04":
            return .beech
        case "T05":
            return .birch
        case "T06":
            return .blackLocust
        case "T07":
            return .cherry
        case "T08":
            return .chestnut
        case "T09":
            return .cypress
        case "T10":
            return .elm
        case "T11":
            return .hawthorn
        case "T12":
            return .hazel
        case "T13":
            return .hornbeam
        case "T14":
            return .lime
        case "T15":
            return .maple
        case "T16":
            return .oak
        case "T17":
            return .other
        case "T18":
            return .pear
        case "T19":
            return .pine
        case "T20":
            return .plane
        case "T21":
            return .poplar
        case "T22":
            return .whitebeam
        case "T23":
            return .willow
        default:
            return .unknown
        }
    }
}

