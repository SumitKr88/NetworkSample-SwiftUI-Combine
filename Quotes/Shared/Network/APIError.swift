//
//  APIError.swift
//  YoutubeRelica
//
//  Created by Sumit Kumar on 06/02/22.
//

import Foundation

enum APIError: Swift.Error {
    case network(URLError)
    case decoding(Error)
}

extension APIError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .network(let error):
            return "Netwok error \(error.localizedDescription)"
        case .decoding(let error):
            return "Decoding error \(error.localizedDescription)"
        }
    }
}
