//
//  QuoteService.swift
//  YoutubeRelica
//
//  Created by Sumit Kumar on 07/02/22.
//

import Foundation
import Combine

protocol QuoteServiceProtocol {
    var apiClient: APIService { get }
    func quotes() -> QuotesPublisher
    func randomQuote() -> QuotePublisher
}

typealias QuotesPublisher = AnyPublisher<QuoteResponseModel, APIError>
typealias QuotePublisher = AnyPublisher<Quote, APIError>

struct QuoteService: QuoteServiceProtocol {
    
    var apiClient: APIService {
        return APIService()
    }
    
    func quotes() -> QuotesPublisher {
        let request: QuoteRequest<Quote> = QuoteRequest()
        return apiClient.publisher(for: request)
    }
    
    func randomQuote() -> QuotePublisher {
        let request: RandomQuoteRequest<Quote> = RandomQuoteRequest()
        return apiClient.publisher(for: request)
    }
    
}


