//
//  TagTableViewCell.swift
//  News
//
//  Created by Galina Savenko on 10.04.2024.
//

import UIKit

class TagTableViewCell: UITableViewCell {
    private var title: String = ""
    private var isViewAllShown: Bool = true
    private var tags = [Tag]()
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView?
    @IBOutlet weak var cellTitleLable: UILabel?
    @IBOutlet weak var isViewAllButton: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewOutlet?.collectionViewLayout = UICollectionViewLayout.fixedSpacedFlowLayout()
        collectionViewOutlet?.dataSource = self
        collectionViewOutlet?.delegate = self
        
        registerCollectionCells()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func config(title: String, tags: [Tag], isViewAllShown: Bool = true) {
        self.title = title
        self.tags = tags
        self.isViewAllShown = isViewAllShown
        
        setupData()
        
    }
    
    private func registerCollectionCells() {
        
        collectionViewOutlet?.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: "TagCollectionViewCell")
        collectionViewOutlet?.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")
    }
    
    private func setupData() {
        cellTitleLable?.text = title
    }
    
    func setupStyle() {
        cellTitleLable?.font = .appHeaderTitle
        cellTitleLable?.textColor = .appHeaderTextColor
        
        isViewAllButton?.setTitleColor(.appPrimary, for: .normal)
        isViewAllButton?.titleLabel?.font = .appButtonTitleFont
    }
}

extension TagTableViewCell: UICollectionViewDelegate{
    
}

extension TagTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as? TagCollectionViewCell else {
                return UICollectionViewCell()
            }
        cell.configCell(tag: tags[indexPath.row].displayName)
            return cell
        }
    
    
}


