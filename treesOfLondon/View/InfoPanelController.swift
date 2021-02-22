//
//  InfoPanelController.swift
//  treesOfLondon
//
//  Created by Andras Pal on 10/06/2020.
//  Copyright © 2020 Andras Pal. All rights reserved.
//

import UIKit

class InfoPanelController: UIViewController, UITextViewDelegate {
    
    // For dismissing the view
    @IBAction private func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // The main title of the view
    @IBOutlet private weak var titleLabel: UILabel!
    // The main text in the view
    @IBOutlet private weak var textLabel: UILabel!
    // The label for the link
    @IBOutlet private weak var linkLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up the title
        titleLabel.text = String.getString(.about)
        titleLabel.textColor = .textMainColour
        
        // Setting up the main text
        textLabel.text = String.getString(.infoText)
        textLabel.textColor = .textMainColour
        
        // Setting up the link
        let linkText = String.getString(.londonDatastore)
        let linkString = NSMutableAttributedString(string: linkText)
        linkString.addAttribute(NSAttributedString.Key.link, value: NSURL(string: String.getString(.datastoreLink))!, range: NSMakeRange(0, linkText.count))
        linkString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: kUI.Size.regularFont), range: NSMakeRange(0, linkText.count))
        linkString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, linkText.count))
        linkLabel.attributedText = linkString
        linkLabel.delegate = self
        linkLabel.isSelectable = true
        linkLabel.isUserInteractionEnabled = true
    }
}
