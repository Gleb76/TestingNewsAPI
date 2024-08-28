//
//  NewsEndpoint.swift
//  TestingNewsAPI
//
//  Created by Глеб Клыга on 28.08.24.
//

import Foundation

protocol APIBuilder {
    var urlRequst: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}
