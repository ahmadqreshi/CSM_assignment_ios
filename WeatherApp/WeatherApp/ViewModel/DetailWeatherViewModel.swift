//
//  DetailWeatherViewModel.swift
//  WeatherApp
//
//  Created by Ahmad Qureshi on 18/09/23.
//

import Foundation


class DetailWeatherViewModel: ObservableObject {
    
    
    
    @Published var weatherForecastDetail: [Forecastday] = [] // to poulate 3 days forecast detail
    @Published var weatherHistoryDetail: [Forecastday] = [] // to populate weather history
    @Published var showLoader: Bool = false // to shoe Loader View
    @Published var showErrorMessage: Bool = false // error message shown in Alert
    @Published var responseMessage: String = "" // Description of error message shown in Alert
    
    
    //MARK: - Call weather Forecast API
    func getWeatherForecast(latQuery: String) { // LatQuery is the name of City
        showLoader = true
        DataRepository.shared.getWeatherForecast(latQuery: latQuery, days: 3) { [weak self] (data) in
            DispatchQueue.main.async {
                self?.weatherForecastDetail = data.forecast?.forecastday ?? []
            }
            self?.getWeatherHistory(latQuery: latQuery)
            debugPrint(data)
        } failure: { [weak self] (message) in
            DispatchQueue.main.async {
                self?.showLoader = false
                self?.responseMessage = message.isEmpty ? "No location found" : message
                self?.showErrorMessage = true
            }
        }
    }
    
    //MARK: - Call Weather History API
    func getWeatherHistory(latQuery: String) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let result = dateFormatter.string(from: date)
        DataRepository.shared.getWeatherHistory(latQuery: latQuery, date: result) { [weak self] (data) in
            DispatchQueue.main.async {
                self?.weatherHistoryDetail = data.forecast?.forecastday ?? []
                self?.showLoader = false
            }
            debugPrint(data)
        } failure: { [weak self] (message) in
            DispatchQueue.main.async {
                self?.showLoader = false
                self?.responseMessage = message.isEmpty ? "No location found" : message
                self?.showErrorMessage = true
            }
        }

    }
}
