//
//  Config.swift
//  TestingNewsAPI
//
//  Created by Глеб Клыга on 28.08.24.
//

import Foundation

class Config {
    static let shared = Config()

    private init() {}

    var apiKey: String {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: path),
              let key = plist["APIKey"] as? String else {
            fatalError("Unable to load API key from Config.plist")
        }
        return key
    }
}
