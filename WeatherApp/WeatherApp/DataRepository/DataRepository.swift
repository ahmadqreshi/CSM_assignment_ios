//
//  DataRepository.swift
//  WeatherApp
//
//  Created by Ahmad Qureshi on 18/09/23.
//

import Foundation
class DataRepository {
    
    static let shared = DataRepository()
    
    func getCurrentWeather(latQuery: String, success: @escaping (WeatherResponseModel) -> Void, failure: @escaping (String) -> Void) {
        APIService.shared.request(resultType: WeatherResponseModel.self, endpoint: .currentWeather(latQuery: latQuery)) { response in
            switch response {
            case .success(let data):
                success(data)
            case .failure(let error):
                switch error {
                case .decodingProblem :
                    failure("response problem")
                case .responseProblem :
                    failure("response problem")
                case .failureMessage(let message) :
                    failure(message)
                }
            }
        }
    }
    
    func getWeatherForecast(latQuery: String, days: Int, success: @escaping (WeatherResponseModel) -> Void, failure: @escaping (String) -> Void) {
        APIService.shared.request(resultType: WeatherResponseModel.self, endpoint: .weatherForecast(latQuery: latQuery, days: days)) { response in
            switch response {
            case .success(let data):
                success(data)
            case .failure(let error):
                switch error {
                case .decodingProblem :
                    failure("response problem")
                case .responseProblem :
                    failure("response problem")
                case .failureMessage(let message) :
                    failure(message)
                }
            }
        }
    }
    
    func getWeatherHistory(latQuery: String, date: String, success: @escaping (WeatherResponseModel) -> Void, failure: @escaping (String) -> Void) {
        APIService.shared.request(resultType: WeatherResponseModel.self, endpoint: .historyWeather(latQuery: latQuery, date: date)) { response in
            switch response {
            case .success(let data):
                success(data)
            case .failure(let error):
                switch error {
                case .decodingProblem :
                    failure("response problem")
                case .responseProblem :
                    failure("response problem")
                case .failureMessage(let message) :
                    failure(message)
                }
            }
        }
    }
}
