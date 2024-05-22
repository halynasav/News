//
//  ExporeViewController+Extenion.swift
//  News
//
//  Created by Test on 08.04.2024.
//

import Foundation
import UIKit

extension ExploreViewController {
    enum CellTypes {
        case popularTags([Tag])
        case latestNews([Article])
        case recomendationTopic
        var cellIdn: String {
            switch self {
            case .popularTags:
                "TagTableViewCell"
            case .latestNews:
                "LatestNewsTableViewCell"
            case .recomendationTopic:
                "cellIdn2"
            }
        }
        
        var cellNibName: String {
            switch self {
            case .popularTags:
                "TagTableViewCell"
            case .latestNews:
                "LatestNewsTableViewCell"
            case .recomendationTopic:
                "title2"
            }
        }
        
        var cellType: AnyClass? {
            switch self {
            case .popularTags:
                TagTableViewCell.self
            case .latestNews:
                UITableView.self
            case .recomendationTopic:
                UITableView.self
            }
        }
        
        var title: String {
            switch self {
            case .popularTags:
                "Popular Tags"
            case .latestNews:
                ""
            case .recomendationTopic:
                ""
            }
        }


    }
}
