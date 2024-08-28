//
//  NewsEndpoint.swift
//  TestingNewsAPI
//
//  Created by Глеб Клыга on 28.08.24.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

enum NewsAPI {
    case getNews(query: String)
}

extension NewsAPI: APIBuilder {
    
    var baseUrl: URL {
        return URL(string: "https://newsapi.org/v2")!
    }
    
    var path: String {
        switch self {
        case .getNews:
            return "/everything"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .getNews(let query):
            let apiKey = ProcessInfo.processInfo.environment["API_KEY"] ?? ""
            return [
                URLQueryItem(name: "q", value: query),
                URLQueryItem(name: "apiKey", value: apiKey)
            ]
        }
    }
    
    var urlRequest: URLRequest {
        var urlComponents = URLComponents(url: baseUrl.appendingPathComponent(path), resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
            fatalError("Invalid URL")
        }
        
        return URLRequest(url: url)
    }
}
