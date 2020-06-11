//
//  InfoPanelController.swift
//  treesOfLondon
//
//  Created by Andras Pal on 10/06/2020.
//  Copyright © 2020 Andras Pal. All rights reserved.
//

import UIKit

class InfoPanelController: UIViewController {

    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        
    }

    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(InfoPanelController.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

}
