//
//  CurrentWeatherModel.swift
//  WeatherApp
//
//  Created by Ahmad Qureshi on 18/09/23.
//

import Foundation
struct CurrentWeatherModel: Codable {
    let humidity: Int?
    let condition: Condition?
    let tempC: Double?
    let feelslikeC: Double?
    let uv: Int?
    let windKph: Double?

    enum CodingKeys: String, CodingKey {
        case humidity, condition
        case tempC = "temp_c"
        case feelslikeC = "feelslike_c"
        case uv
        case windKph = "wind_kph"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: String
}
