//
//  SavedTableViewCell.swift
//  News
//
//  Created by Galina Savenko on 15.05.2024.
//

import UIKit

class SavedTableViewCell: UITableViewCell {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var imageIndicator: UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell (item: SavedNews) {
        titleLabel.text = item.title
        authorLabel.text = item.author
        dataLabel.text = item.publishedAt
        articleImage.image = item.imageNews
        imageIndicator.isHidden = !(item.isLoading ?? true)
    }

}
