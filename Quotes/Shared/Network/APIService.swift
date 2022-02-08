//
//  APIService.swift
//  YoutubeRelica
//
//  Created by Sumit Kumar on 06/02/22.
//

import Foundation
import Combine


protocol APIProtocol {
    
    func publisher(for request: APIRequestBuilder) -> AnyPublisher<Data, APIError>
    func publisher<T: Decodable>(for request: APIRequestBuilder,
                                 decoder: JSONDecoder) -> AnyPublisher<T, APIError>
}


struct APIService: APIProtocol {
    func publisher(for request: APIRequestBuilder) -> AnyPublisher<Data, APIError> {
        URLSession.shared.dataTaskPublisher(for: request.urlRequest())
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .receive(on: DispatchQueue.main)
            .mapError(APIError.network)
            .map(\.data)
            .eraseToAnyPublisher()
    }
    
    func publisher<T>(for request: APIRequestBuilder, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, APIError> where T : Decodable {
        URLSession.shared.dataTaskPublisher(for: request.urlRequest())
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .receive(on: DispatchQueue.main)
            .mapError(APIError.network)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .mapError(APIError.decoding)
            .eraseToAnyPublisher()
    }
}
