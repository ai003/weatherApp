//
//  ContentView.swift
//  WeatherApp
//
//  Created by Alvin Ishimwe on 8/28/22.
//

import SwiftUI

struct ContentView: View {
    //initialize location Manager
    @StateObject var locationManager = LocationManager()
    //stateeObj-so the view can be notified anytime publish vars are updated
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    
    var body: some View {
        VStack {
            //location is option so if not there then coordinates will not be displayed
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView().task {
                        do {
                            weather = try await
                            weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                        } catch {
                            print("Error getting weather: \(error)")
                        }
                    }
                    
                }
            } else {
                if locationManager.isLoading {
                        LoadingView()
                    } else {
                        WelcomePage()
                            .environmentObject(locationManager)
                    }
            }
        }
        .background(Color(hue: 0.703, saturation: 0.913, brightness: 0.815))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
