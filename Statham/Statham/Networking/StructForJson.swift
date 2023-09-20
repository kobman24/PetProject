//
//  StructForJson.swift
//  Statham
//
//  Created by Сейран on 19.09.2023.
//

import Foundation

struct ForismaticQuote: Codable {
    let quoteText: String
    let quoteAuthor: String

    enum CodingKeys: String, CodingKey {
        case quoteText = "quoteText"
        case quoteAuthor = "quoteAuthor"
    }
}
