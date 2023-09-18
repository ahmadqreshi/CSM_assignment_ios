//
//  WeatherForecastModel.swift
//  WeatherApp
//
//  Created by Ahmad Qureshi on 18/09/23.
//

import Foundation
struct WeatherForecastModel: Codable {
    let forecastday: [Forecastday]
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let hour: [Hour]
    let day: Day
    let astro: Astro
    let date: String
}

// MARK: - Astro
struct Astro: Codable {
    let sunrise, sunset: String
}

// MARK: - Day
struct Day: Codable {
    let avgtempC, maxwindKph: Double
    let condition: DayCondition
    let avghumidity: Int
    let maxtempC, mintempC: Double

    enum CodingKeys: String, CodingKey {
        case avgtempC = "avgtemp_c"
        case maxwindKph = "maxwind_kph"
        case condition, avghumidity
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
    }
}

// MARK: - DayCondition
struct DayCondition: Codable {
    let icon: String
}

// MARK: - Hour
struct Hour: Codable {
    let humidity: Int
    let condition: HourCondition
    let tempC, feelslikeC: Double
    let chanceOfRain, chanceOfSnow: Int

    enum CodingKeys: String, CodingKey {
        case humidity, condition
        case tempC = "temp_c"
        case feelslikeC = "feelslike_c"
        case chanceOfRain = "chance_of_rain"
        case chanceOfSnow = "chance_of_snow"
    }
}

// MARK: - HourCondition
struct HourCondition: Codable {
    let text: String
}
