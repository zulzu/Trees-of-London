//
//  InfoPanelController.swift
//  treesOfLondon
//
//  Created by Andras Pal on 10/06/2020.
//  Copyright © 2020 Andras Pal. All rights reserved.
//

import UIKit

class InfoPanelController: UIViewController, UITextViewDelegate {
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var linkLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "About\nLONDON TREES"
        titleLabel.textColor = UIColor(red: 124/255, green: 145/255, blue: 133/255, alpha: 1.0)
        
        textLabel.text = "This map visually presents trees in the Inner London boroughs (15 boroughs out of the 32) from Ealing to Greenwhich.\n \nIt shows the location and basic info for over 300,000 street trees, including 22 species, latin names and leaf photos.\n \nIt’s estimated that there are over eight million trees in London, so this map is only a partial illustration.\n \nThe data was collected in 2014-15 by 25 London boroughs, the City of London and Transport for London. (Data wasn’t provided by 7 other boroughs and Outer London boroughs are not yet included in this app.)\n \nResource:"
        
        textLabel.textColor = UIColor(red: 57/255, green: 57/255, blue: 56/255, alpha: 1.0)
        
        let string = "London Datastore"
        let linkString = NSMutableAttributedString(string: string)
        linkString.addAttribute(NSAttributedString.Key.link, value: NSURL(string: "https://data.london.gov.uk/dataset/local-authority-maintained-trees")!, range: NSMakeRange(0, string.count))
        linkString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 16.0), range: NSMakeRange(0, string.count))
        linkString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, string.count))
        
        linkLabel.attributedText = linkString
        linkLabel.delegate = self
        linkLabel.isSelectable = true
        linkLabel.isUserInteractionEnabled = true
        
    }
    
    
}
