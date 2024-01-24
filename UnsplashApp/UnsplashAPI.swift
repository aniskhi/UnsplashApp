//
//  UnsplashAPI.swift
//  UnsplashApp
//
//  Created by Anis KHIARI on 1/24/24.
//

import Foundation

struct UnsplashAPI {
    static let scheme = "https"
    static let host = "api.unsplash.com"
    static let path = "/photos"
    static let topicPath = "/topics"

    static func unsplashApiBaseUrl(path pathChoosen: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = pathChoosen
        components.queryItems = [
            URLQueryItem(name: "client_id", value: ConfigurationManager.instance.plistDictionnary.clientId)
        ]
        return components
    }

    static func feedUrl(orderBy: String = "popular", perPage: Int = 10) -> URL? {
        var components = unsplashApiBaseUrl(path: path)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "order_by", value: orderBy),
            URLQueryItem(name: "per_page", value: "\(perPage)")
        ])

        return components.url
    }
    
    static func topicUrl(orderBy: String = "popular", perPage: Int = 10) -> URL? {
        var components = unsplashApiBaseUrl(path: topicPath)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "order_by", value: orderBy),
            URLQueryItem(name: "per_page", value: "\(perPage)")
        ])

        return components.url
    }
    
    static func topicPhotosUrl(path:String ,orderBy: String = "popular", perPage: Int = 10) -> URL? {
        var components = unsplashApiBaseUrl(path: path)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "order_by", value: orderBy),
            URLQueryItem(name: "per_page", value: "\(perPage)")
        ])

        return components.url
    }
}
