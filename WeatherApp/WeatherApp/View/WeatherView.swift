//
//  ContentView.swift
//  WeatherApp
//
//  Created by Ahmad Qureshi on 18/09/23.
//

import SwiftUI


struct WeatherView: View {
    
    @StateObject private var viewModel: CurrentWeatherViewModel = CurrentWeatherViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.showLoader {
                LoaderView()
            } else {
                VStack {
                    TextField("Enter Location", text: $viewModel.locationText)
                        .padding(.all, 16)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 1)
                        }
                        .padding(.all, 16)
                        .submitLabel(.search)
                        .onSubmit {
                            if !viewModel.locationText.isEmpty {
                                viewModel.getCurrentWeatherApi()
                            }
                        }
                        .tint(.black)
                    
                    
                    
                    NavigationLink(destination: DetailWeatherView(latQuery: viewModel.locationText)) {
                        weatherCard
                    }
                    
                    
                    Spacer()
        
                    getCurrentLocationWeatherButton
                }
            }
        }
        .onAppear {
            viewModel.getCurrentWeatherApi()
        }
        .alert(isPresented: $viewModel.showErrorMessage) {
            Alert(title: Text("Warning"), message: Text(viewModel.responseMessage))
        }
    }
    
    private var weatherCard: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(viewModel.weatherInfo?.location?.name ?? "")
                .foregroundColor(.white)
                .font(.system(size: 30))
                .fontWeight(.semibold)
            
            Text("Temperature \(String(format: "%0.f", viewModel.weatherInfo?.current?.tempC ?? 0 )) °C")
                .fontWeight(.medium)
                .foregroundColor(.white)
            Text("Humidity \(viewModel.weatherInfo?.current?.humidity ?? 0)%")
                .fontWeight(.medium)
                .foregroundColor(.white)
            Text("Wind Speed \(String(format: "%0.f", viewModel.weatherInfo?.current?.windKph ?? "")) Kph")
                .fontWeight(.medium)
                .foregroundColor(.white)
            
        }
        .padding(.all, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.blue)
        }
        .padding(.horizontal, 16)
    }
    
    private var getCurrentLocationWeatherButton: some View {
        Button {
            if !viewModel.locationText.isEmpty {
                viewModel.getCurrentWeatherApi()
            }
        } label: {
            Text("Show Weather")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.all, 16)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black.opacity(0.5))
                }
        }
        .padding(.all, 16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
