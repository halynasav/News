//
//  ExplorerViewController+TableView+Extension.swift
//  News
//
//  Created by Galina Savenko on 10.04.2024.
//
//import Foundation
import UIKit

extension ExploreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contentTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = contentTypes[indexPath.row]

        switch item {
        case let .popularTags(tags):
            if let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdn, for: indexPath) as? TagTableViewCell {
                cell.config(title: item.title, tags: tags)
                return cell
            }
        case let .latestNews(articles):
            if let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdn, for: indexPath) as? LatestNewsTableViewCell {
                cell.config(title: item.title, articles: articles)
                return cell
            }
        case .recomendationTopic:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    
}

extension ExploreViewController: UITableViewDelegate {
    
}
