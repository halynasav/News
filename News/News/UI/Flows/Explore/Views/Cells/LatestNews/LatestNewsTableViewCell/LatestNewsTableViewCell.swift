//
//  LatestNewsTableViewCell.swift
//  News
//
//  Created by Galina Savenko on 29.04.2024.
//

import UIKit

class LatestNewsTableViewCell: UITableViewCell {
    private var articles = [Article]()
    
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sectionTitleLabel: UILabel!

    override func awakeFromNib() {
        registerCollectionCells()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        super.awakeFromNib()
        setupStyle()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func onSeeAllButtonTapped(_ sender: Any) {
        
    }
    
    func config(title: String, articles: [Article]) {
        sectionTitleLabel.text = title
        self.articles = articles
        
        collectionView.reloadData()
    }
    
    func setupStyle() {
        sectionTitleLabel.font = .appHeaderTitle
        sectionTitleLabel.textColor = .appHeaderTextColor
        
        seeAllButton.setTitleColor(.appPrimary, for: .normal)
        seeAllButton.titleLabel?.font = .appButtonTitleFont
    }
    
    private func registerCollectionCells() {
        
        collectionView.register(LatestNewsCollectionViewCell.self, forCellWithReuseIdentifier: "LatestNewsCollectionViewCell")
        collectionView.register(UINib(nibName: "LatestNewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LatestNewsCollectionViewCell")
    }
}

extension LatestNewsTableViewCell: UICollectionViewDelegate {
    
}

extension LatestNewsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestNewsCollectionViewCell",
                                                            for: indexPath
        ) as? LatestNewsCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = articles[indexPath.row]
        cell.configCell(icon: nil, title: item.title, time: item.publishedAt, category: item.source?.name)
        
        return cell
    }
    
}
