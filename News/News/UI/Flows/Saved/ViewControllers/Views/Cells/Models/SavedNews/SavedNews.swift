//
//  SavedNews.swift
//  News
//
//  Created by Galina Savenko on 20.05.2024.
//

import Foundation
import UIKit

struct SavedNews {
    var title: String?
    var author: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    var source: ArticleSource?
    var isLoading: Bool?
    var imageNews: UIImage?
    
    init(title: String? = nil, author: String? = nil, description: String? = nil, url: String? = nil, urlToImage: String? = nil, publishedAt: String? = nil, content: String? = nil, source: ArticleSource? = nil, isLoading: Bool? = nil, imageNews: UIImage? = nil) {
        self.title = title
        self.author = author
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
        self.source = source
        self.isLoading = isLoading
        self.imageNews = imageNews
    }
    
    init (article: Article) {
        self.title = article.title
        self.author = article.author
        self.description = article.description
        self.url = article.url
        self.urlToImage = article.urlToImage
        self.publishedAt = article.publishedAt
        self.content = article.content
        self.source = article.source
        self.isLoading = nil
        self.imageNews = nil
    }
}


