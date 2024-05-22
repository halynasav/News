//
//  Networkmanager.swift
//  News
//
//  Created by Galina Savenko on 10.04.2024.
//

import Foundation

protocol NetworkManager {
    func fetchTags(complition: (([Tag]) -> Void))
    func fetchLatestNews(complition: @escaping(Result<[Article], Error>) -> Void)
}

class URLNetworkManager: NetworkManager {
    private var tagNetworkManager: TagsNetworkManager = TagsNetworkManagerMock()
    private var newsNetworkManager: NewsNetworkManager = URLNewsNetworkManager()
    
    func fetchTags(complition: (([Tag]) -> Void)) {
        tagNetworkManager.fetchTags(complition: complition)
    }
    
    func fetchLatestNews(complition: @escaping(Result<[Article], Error>) -> Void) {
        newsNetworkManager.fetchLatestNews(complition: complition)
    }

}
