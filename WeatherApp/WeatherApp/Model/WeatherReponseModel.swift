//
//  WeatherReponseModel.swift
//  WeatherApp
//
//  Created by Ahmad Qureshi on 18/09/23.
//

import Foundation



struct WeatherResponseModel: Codable {
    let current: CurrentWeatherModel?
    let location: Location?
    let forecast: WeatherForecastModel?
}

// MARK: - Location
struct Location: Codable {
    let region, country, localtime: String?
    let lon, lat: Double?
    let tzID, name: String?
    let localtimeEpoch: Int?

    enum CodingKeys: String, CodingKey {
        case region, country, localtime, lon, lat
        case tzID = "tz_id"
        case name
        case localtimeEpoch = "localtime_epoch"
    }
}
