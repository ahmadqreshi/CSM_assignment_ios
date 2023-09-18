//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by Ahmad Qureshi on 18/09/23.
//

import Foundation

class CurrentWeatherViewModel: ObservableObject {
    
        
    @Published var locationText: String = "Paris" // Text from Text Field
    @Published var weatherInfo: WeatherResponseModel? // used to populate temperature
    @Published var showLoader: Bool = false // for showing loader view
    @Published var showErrorMessage: Bool = false // message shown in alert in case result is not found
    @Published var responseMessage: String = "" // description of message shown in alert
    
    
    //MARK: - Call Weather API
    func getCurrentWeatherApi() {
        showLoader = true
        DataRepository.shared.getCurrentWeather(latQuery: locationText) { [weak self] (data) in
            DispatchQueue.main.async {
                self?.weatherInfo = data
                self?.showLoader = false
            }
        } failure: { [weak self] (message) in
            DispatchQueue.main.async {
                self?.showLoader = false
                self?.responseMessage = message.isEmpty ? "No location found" : message
                self?.showErrorMessage = true
            }
        }
    }
}
