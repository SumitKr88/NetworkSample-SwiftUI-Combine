//
//  APIRequestBuilder.swift
//  YoutubeRelica
//
//  Created by Sumit Kumar on 07/02/22.
//

import Foundation

public enum NetworkMethod: Equatable {
    case get
    case put(Data?)
    case post(Data?)

    var name: String {
        switch self {
        case .get: return "GET"
        case .put: return "PUT"
        case .post: return "POST"
        }
    }
}

/// A dictionary of parameters to apply to a `URLRequest`.
public typealias Parameters = [String: Any]

public protocol APIRequestBuilder {
    
    /// The target's base `URL`.
    var baseURL: URL { get }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }
    
    var method: NetworkMethod { get }
    
    func urlRequest() -> URLRequest
    
    /// Provides stub data for use in testing.
    func sampleData() -> Data?
    
    /// The Parameters to be used in the request
    func parameters() -> Parameters?
    
    func headers() -> [String: String]?
    
}

extension APIRequestBuilder {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.quotable.io") else {
            fatalError("Unable to configure base url")
        }
        return url
    }
    
    func sampleData() -> Data? {
        return Data()
    }
    
    func urlRequest() -> URLRequest {
        var request = URLRequest(url: baseURL)

        switch method {
        case .post(let data), .put(let data):
            request.httpBody = data
        case .get:
            let url = baseURL.appendingPathComponent(path)
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            //components.queryItems = [URLQueryItem(name: "api_key", value: "your_api_key_here")] //
            guard let url = components?.url else { preconditionFailure("Invalid URL format...") }
            request = URLRequest(url: url)
        }

        request.allHTTPHeaderFields = headers()
        request.httpMethod = method.name
        return request
    }
    
    func parameters() -> Parameters? {
        return nil
    }
    
    func headers() -> [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
