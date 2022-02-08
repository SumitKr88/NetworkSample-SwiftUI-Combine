//
//  QuoteRequest.swift
//  YoutubeRelica
//
//  Created by Sumit Kumar on 07/02/22.
//

import Foundation

struct QuoteRequest<T: Decodable>: APIRequestBuilder {

    var path: String {
        return "quotes"
    }
    
    var method: NetworkMethod {
        return .get
    }
    
}

struct RandomQuoteRequest<T: Decodable>: APIRequestBuilder {

    var path: String {
        return "random"
    }
    
    var method: NetworkMethod {
        return .get
    }
    
}
