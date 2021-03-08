//
//  Strings.swift
//  London Trees
//
//  Created by Andras Pal on 18/02/2021.
//  Copyright © 2021 Andras Pal. All rights reserved.
//

import Foundation

/// A key for retrieving a String that can be displayed to the user
enum StringKey: String, CaseIterable {
    
    /// The word "Back"
    case back
    /// The word "Home"
    case home
    /// A generic error message
    case errorMsg
    /// The "About London trees" label on the info panel
    case about
    /// The main text on the info panel
    case infoText
    /// The "London Datastore" label
    case londonDatastore
    /// The link for the datastore
    case datastoreLink
    /// The word "Settings"
    case settings
    /// The label "Allow Location Access"
    case locAccess
    /// The message for requesting access for the location service
    case locAccessWarning
    /// The word "OK"
    case ok
    /// The title text on the loading data view
    case loadingDataTitle
    /// The body text on the loading data view
    case loadingDataMessage
}

extension String {
    
    /// Retrieves any non-database stored strings for the app.
    /// - Parameter stringKey: An instance of StringKey
    /// - Returns: A String
    static func getString(_ stringKey: StringKey) -> String {
        guard let string = StringProvider.strings[stringKey] else {
            assertionFailure("A String could not be retreived for StringKey: '\(stringKey.rawValue)'")
            return "MISSING TEXT"
        }
        return string
    }
}

fileprivate struct StringProvider {
    
    /// A dictionary containing all the static strings for the app
    static var strings: [StringKey: String] {
        [
            .back: "Back",
            .home: "Home",
            .errorMsg: "Error, could't retrieve data",
            .about: "About Trees of London",
            .infoText: "This map visually presents trees in the Inner London boroughs (15 boroughs out of the 32) from Ealing to Greenwich.\n \nIt shows the location and basic info for over 300,000 street trees, including 22 species, latin names and leaf photos. It’s estimated that there are over eight million trees in London, so this map is only a partial illustration.\n \nThe data was collected in 2014-15 by 25 London boroughs, the City of London and Transport for London. (Data wasn’t provided by 7 other boroughs and Outer London boroughs are not yet included in this app.)\n \nResource:",
            .londonDatastore: "London Datastore",
            .datastoreLink: "https://data.london.gov.uk/dataset/local-authority-maintained-trees",
            .settings: "Settings",
            .locAccess: "Allow Location Access",
            .locAccessWarning: "Trees of London needs to access your location to show trees in your area.  When location is not available or you aren’t in central London, we’ll use a central London location instead.",
            .ok: "OK",
            .loadingDataTitle: "Loading all the trees",
            .loadingDataMessage: "There are many, so this can take a few seconds…",
            
        ]
    }
}
