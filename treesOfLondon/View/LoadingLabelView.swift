//
//  LoadingLabelView.swift
//  Trees of London
//
//  Created by Andras Pal on 04/03/2021.
//  Copyright © 2021 Andras Pal. All rights reserved.
//

import UIKit

class LoadingLabelView: UIView {
    
    private let loadingTitle = UILabel()
    private let loadingMessage = UILabel()
    private let mainHStackView = UIStackView()
    private let labelsVStackView = UIStackView()
    private let loadingImage = UIImageView(image: UIImage(imageLiteralResourceName: "maploading_icon.png"))
    private let imageHeight: CGFloat = (kUI.Size.loadingViewHeight - (kUI.Padding.labelEdge * 2))
    
    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: kUI.Size.cornerRadius)
        roundedRect.addClip()
        UIColor.messageBoxBg.setFill()
        roundedRect.fill()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        backgroundColor = .clear
        
        addSubview(labelsVStackView)
        setupStackView(stackView: labelsVStackView, axis: .vertical, alignment: .leading)

        labelsVStackView.addArrangedSubview(updateLoadingLabel(label: loadingTitle, text: String.getString(.loadingDataTitle), isBold: true))
        labelsVStackView.addArrangedSubview(updateLoadingLabel(label: loadingMessage, text: String.getString(.loadingDataMessage)))
        
        addSubview(mainHStackView)
        setupStackView(stackView: mainHStackView, axis: .horizontal, alignment: .center)
        
        mainHStackView.addArrangedSubview(loadingImage)
        mainHStackView.addArrangedSubview(labelsVStackView)

        loadingImage.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        loadingImage.widthAnchor.constraint(equalToConstant: loadingImage.frame.width / (loadingImage.frame.height / imageHeight)).isActive = true
        loadingImage.leadingAnchor.constraint(lessThanOrEqualTo: self.leadingAnchor, constant: kUI.Padding.labelEdge + (kUI.Padding.loadingViewExtraPadding / 2)).isActive = true

        mainHStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: (kUI.Padding.labelEdge)).isActive = true
        mainHStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(kUI.Padding.labelEdge)).isActive = true
        mainHStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: kUI.Padding.labelEdge).isActive = true
        
        labelsVStackView.leadingAnchor.constraint(lessThanOrEqualTo: loadingImage.trailingAnchor, constant: kUI.Padding.labelEdge + kUI.Padding.loadingViewExtraPadding).isActive = true
        labelsVStackView.trailingAnchor.constraint(lessThanOrEqualTo: mainHStackView.trailingAnchor, constant: kUI.Padding.labelEdge).isActive = true

        loadingImage.blink()
    }
    
    private func updateLoadingLabel(label: UILabel, text: String, isBold: Bool? = false) -> UILabel {
        label.numberOfLines = 0
        label.textColor = .messageBoxText
        label.text = text
        isBold == true ? (label.font = .boldSystemFont(ofSize: kUI.Size.regularFont)) : (label.font = .systemFont(ofSize: kUI.Size.regularFont))
        return label
    }
    
    private func setupStackView(stackView: UIStackView, axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment) {
        stackView.spacing = kUI.Spacing.medium
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = axis
        stackView.alignment = alignment
    }
}
