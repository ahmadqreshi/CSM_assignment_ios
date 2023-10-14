//
//  EndPoint.swift
//  WeatherApp
//
//  Created by Ahmad Qureshi on 18/09/23.
//

import Foundation

enum Endpoint {
        
    case currentWeather(latQuery: String)
    case historyWeather(latQuery: String, date: String)
    case weatherForecast(latQuery: String, days: Int)
    
    
    
    
    var urlEndpoint: String {
        switch self {
        case .currentWeather:
            return "current.json"
        case .historyWeather:
            return "history.json"
        case .weatherForecast:
            return "forecast.json"
        }
    }
    
    var method: String {
        switch self {
        case .currentWeather:
            return "GET"
        case .historyWeather:
            return "GET"
        case .weatherForecast:
            return "GET"
        }
    }
    
    
    var urlString: String {
        return "https://api.weatherapi.com/v1/\(self.urlEndpoint)"
    }
    
    var url: URL? {
        guard var urlComponents = URLComponents(string: urlString) else { return  nil}
        let apiKey = "YOUR KEY HERE"
        switch self {
        case .currentWeather(let latQuery):
            urlComponents.queryItems = [
                URLQueryItem(name: "key", value: apiKey),
                URLQueryItem(name: "q", value: latQuery)
            ]
        case .historyWeather(let latQuery, let date):
            urlComponents.queryItems = [
                URLQueryItem(name: "key", value: apiKey),
                URLQueryItem(name: "q", value: latQuery),
                URLQueryItem(name: "dt", value: date)
            ]
        case .weatherForecast(let latQuery, let days):
            urlComponents.queryItems = [
                URLQueryItem(name: "key", value: apiKey),
                URLQueryItem(name: "q", value: latQuery),
                URLQueryItem(name: "days", value: "\(days)")
            ]
        }
        return urlComponents.url
    }
}
