//
//  News.swift
//  NewsFeed
//
//  Created by Igor Ogai on 15.07.2021.
//

import Foundation

struct News: Decodable {
    let author: String?
    let title: String
    let description: String?
    let url: URL
    let image: URL?
    let time: String
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case image = "urlToImage"
        case time = "publishedAt"
        case content = "content"
    }
}

struct NewsResponse: Decodable {
    let articles: [News]
}

