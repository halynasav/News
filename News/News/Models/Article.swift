//
//  Article.swift
//  News
//
//  Created by Test on 03.04.2024.
//

import Foundation

struct Article: Decodable {
    var title: String?
    var author: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String? 
    var source: ArticleSource?
}
