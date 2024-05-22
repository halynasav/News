//
//  TagsNetworkManagerMock.swift
//  News
//
//  Created by Galina Savenko on 22.04.2024.
//

import Foundation

final class TagsNetworkManagerMock: TagsNetworkManager {
    func fetchTags(complition: (([Tag]) -> Void)) {
        var tags = [Tag]()
        tags.append(Tag(displayName: "#sport", id: 1, tag: "sport"))
        tags.append(Tag(displayName: "#education", id: 2, tag: "education"))
        tags.append(Tag(displayName: "#health", id: 3, tag: "health"))
        tags.append(Tag(displayName: "#news", id: 4, tag: "news"))
        tags.append(Tag(displayName: "#football", id: 5, tag: "football"))
        tags.append(Tag(displayName: "#iOS", id: 6, tag: "iOS"))
        tags.append(Tag(displayName: "#worklifebalance", id: 7, tag: "worklifebalance"))
        tags.append(Tag(displayName: "#events", id: 8, tag: "events"))
        tags.append(Tag(displayName: "#friday", id: 9, tag: "friday"))
        tags.append(Tag(displayName: "#Ukraine", id: 10, tag: "Ukraine"))
        tags.append(Tag(displayName: "#flower", id: 11, tag: "flower"))
        complition(tags)
    }
    
}
