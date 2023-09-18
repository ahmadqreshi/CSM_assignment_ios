//
//  DetailWeatherView.swift
//  WeatherApp
//
//  Created by Ahmad Qureshi on 18/09/23.
//

import SwiftUI

struct DetailWeatherView: View {
    
    @StateObject private var viewModel: DetailWeatherViewModel = DetailWeatherViewModel()
    
    var latQuery: String
    var body: some View {
        ZStack(alignment: .top) {
            if viewModel.showLoader {
                LoaderView()
            } else {
                ScrollView(.vertical) {
                    VStack {
                        Text("Weather Forecast (3 Days)")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        
                        ForEach(Array(viewModel.weatherForecastDetail.enumerated()), id: \.offset) { index, data in
                            forecastCardView(data: data)
                        }
                        
                        Text("Weather History")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        
                        ForEach(Array(viewModel.weatherHistoryDetail.enumerated()), id: \.offset) { index, data in
                            forecastCardView(data: data)
                        }
                        Spacer()
                    }
                }
            }
        }
        .onAppear {
            viewModel.getWeatherForecast(latQuery: latQuery)
        }
        .alert(isPresented: $viewModel.showErrorMessage) {
            Alert(title: Text("Warning"), message: Text(viewModel.responseMessage))
        }
    }
    
    
    @ViewBuilder private func forecastCardView(data: Forecastday) -> some View {
        VStack(alignment: .leading) {
            Text("Date \(data.date)")
                .foregroundColor(.white)
                .fontWeight(.medium)
            Text("Minimum Temperature \(String(format: "%0.f", data.day.mintempC )) °C")
                .foregroundColor(.white)
                .fontWeight(.medium)
            Text("Maximumm Temperature \(String(format: "%0.f", data.day.maxtempC )) °C")
                .foregroundColor(.white)
                .fontWeight(.medium)
            Text("Average Temperature \(String(format: "%0.f", data.day.avgtempC )) °C")
                .foregroundColor(.white)
                .fontWeight(.medium)
            Text("Average Humidity \(data.day.avghumidity)%")
                .foregroundColor(.white)
                .fontWeight(.medium)
        }
        .padding(.all, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.blue)
        }
        .padding(.horizontal, 16)
    }
}

struct DetailWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView(latQuery: "Paris")
    }
}
