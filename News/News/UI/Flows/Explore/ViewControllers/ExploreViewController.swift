//
//  ExploreViewController.swift
//  News
//
//  Created by Test on 08.04.2024.
//

import UIKit

class ExploreViewController: UIViewController {
    private var networkManager: NetworkManager = URLNetworkManager()
    private(set) var contentTypes: [CellTypes] = [] /*[.latestNews, .recomendationTopic]*/
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var contentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.fetchTags { tags in
            contentTypes.insert(.popularTags(tags), at: 0)
            contentTableView.reloadData()
        }
        networkManager.fetchLatestNews { [self] res in
            switch res {
            case .success(let articles):
                contentTypes.insert(.latestNews(articles), at: 1)
                DispatchQueue.main.async {
                    self.contentTableView.reloadData()
                }
            case .failure(let failure):
//                TO DO: aff UI error state
                break
            }
//            contentTypes.insert(.latestNews(articles), at: 1)
        }
        
        navigationItem.titleView = searchBar
        view.backgroundColor = UIColor.red
        
        setupContentTableView()
        regiesterCells()
}
    
    private func setupContentTableView() {
        contentTableView.estimatedRowHeight = 150
        
        contentTableView.delegate = self
        contentTableView.dataSource = self
        
        //        contentTypes.forEach {
        //            contentTableView.register(UINib(nibName: $0.cellNibName, bundle: nil), forCellReuseIdentifier: $0.cellIdn)
        //            contentTableView.register($0.cellType, forCellReuseIdentifier: $0.cellIdn)
        //
        //        }
        
        contentTableView.register(TagTableViewCell.self, forCellReuseIdentifier: "TagTableViewCell")
        contentTableView.register(UINib(nibName: "TagTableViewCell", bundle: nil), forCellReuseIdentifier: "TagTableViewCell")
        
        
        contentTableView.register(TagTableViewCell.self, forCellReuseIdentifier: "LatestNewsTableViewCell")
        contentTableView.register(UINib(nibName: "LatestNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "LatestNewsTableViewCell")
    }
    
    private func regiesterCells() {
//        lastNewsCollectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: "NewsCollectionViewCell")
//        lastNewsCollectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "NewsCollectionViewCell")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
