//
//  LatestNewsCollectionViewCell.swift
//  News
//
//  Created by Galina Savenko on 29.04.2024.
//

import UIKit

class LatestNewsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var newsTitleLable: UILabel!
    @IBOutlet weak var categoryLable: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var dortView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }
    
    func configCell(icon: URL?, title: String?, time: String?, category: String?) {
        newsTitleLable.text = title
        categoryLable.text = category
        timeLable.text = time
        
//        TODO: downoload image
    }
    
    private func setupStyle() {
        newsTitleLable.textColor = .appHeaderTextColor
        newsTitleLable.font = .appSecondTitleFont
        
        categoryLable.textColor = .appPrimary
        categoryLable.font = .appTextFont
        
        timeLable.textColor = .appSecondary
        timeLable.font = .appTextFont
        
        mainImage.layer.cornerRadius = 8
        mainImage.backgroundColor = .gray
        
        dortView.layer.cornerRadius = 2
        dortView.clipsToBounds = true
    }
}
