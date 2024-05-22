//
//  NewsCollectionViewCell.swift
//  News
//
//  Created by Test on 08.04.2024.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var contentStackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setupStyle() {
        contentStackView.layer.cornerRadius = 10
        contentStackView.layer.backgroundColor = UIColor.appSecondaryBackground.cgColor
        contentStackView.clipsToBounds = true
        tagLabel.textColor = UIColor.appSecondary
    }
    
    func configCell(tag: String) {
        tagLabel.text = tag
        tagLabel.sizeToFit()
        tagLabel.setNeedsLayout()
        setupStyle()
    }

}
