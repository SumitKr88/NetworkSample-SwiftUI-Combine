//
//  Quote.swift
//  YoutubeRelica
//
//  Created by Sumit Kumar on 06/02/22.
//

import Foundation

// MARK: - Welcome
struct QuoteResponseModel: Codable {
    let count, totalCount, page, totalPages: Int
    let lastItemIndex: Int
    let results: [Quote]
}

enum Tag: String, Codable {
    case famousQuotes = "famous-quotes"
    case happiness = "happiness"
    case inspirational = "inspirational"
    case success = "success"
    case wisdom = "wisdom"
}

struct Quote: Codable, Identifiable {
    let tags: [Tag]
    let id, author, content, authorSlug: String
    let length: Int
    let dateAdded, dateModified: String

    enum CodingKeys: String, CodingKey {
        case tags
        case id = "_id"
        case author, content, authorSlug, length, dateAdded, dateModified
    }
}

extension QuoteResponseModel {
    static let dummy = QuoteResponseModel(count: 2, totalCount: 10, page: 1, totalPages: 5, lastItemIndex: 1,
                                          results: [Quote(tags: [Tag.famousQuotes], id: "dummy", author: "Author name", content: "fail Better - Quote", authorSlug: "", length: 10, dateAdded: "today", dateModified: "Today")])
}
