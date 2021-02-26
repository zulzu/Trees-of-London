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
    /// The text on the loading data label
    case loadingData
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
            .infoText: "This map visually presents trees in London using a public database available on the London Datastore website.\n \nIt shows the locations and species for over 300,000 street trees. Overall it has 22 species plus a collective group - ‘Other’ - for less common trees. Latin names and photos of leaves also included to help visual identification.\n \nIt’s estimated that there are over eight million trees in London, so this map is only a partial illustration.\n \nThe data was collected in 2014-15 by 25 London boroughs, the City of London and Transport for London. (Data wasn’t provided by 7 other boroughs.)\n \nResource:",
            .londonDatastore: "London Datastore",
            .datastoreLink: "https://data.london.gov.uk/dataset/local-authority-maintained-trees",
            .settings: "Settings",
            .locAccess: "Allow Location Access",
            .locAccessWarning: "Trees of London needs access to your location. Turn on Location Services in your device settings. When location is not available or you are not in London, the application will use a default location.",
            .ok: "OK",
            .loadingData: "Loading data\nThis can take a few seconds...",
            
        ]
    }
}
