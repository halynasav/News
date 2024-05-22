//
//  TagsNetworkManager.swift
//  News
//
//  Created by Galina Savenko on 22.04.2024.
//

import Foundation

protocol TagsNetworkManager {
    func fetchTags(complition: (([Tag]) -> Void))
}
    
final class URLTagsNetworkManager: TagsNetworkManager {
    
    func fetchTags(complition: (([Tag]) -> Void)) {
    
    }

    }

