//
//  FeedStoriesCellInfo.swift
//  instagram-snapkit
//
//  Created by Павел Петров on 07.10.2023.
//

import UIKit

struct FeedStoriesItemCellInfo {
    let image: UIImage
    let username: String
    let isAddButtonVisible: Bool
    let isNewStory: Bool
}

typealias FeedStoriesCellInfo = [FeedStoriesItemCellInfo]
