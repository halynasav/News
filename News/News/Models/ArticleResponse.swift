//
//  ArticleResponse.swift
//  News
//
//  Created by Test on 03.04.2024.
//

import Foundation

struct ArticleResponse: Decodable {
    var totalResults: Int
    var articles: [Article]
}
