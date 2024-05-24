//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Alvin Ishimwe on 9/4/22.
//

import SwiftUI

private let defaultIcon = "?"

private let iconMap = [
    "Drizzle" : "cloud.drizzle.fill",
    
    "Thunderstorm" : "cloud.bolt.fill",
    
    "Rain" : "cloud.heavyrain.fill",
    
    "Snow" : "snowflake",
    
    "Clear" : "sun.max.fill",
    
    "Clouds" : "smoke.fill"
    
]

struct WeatherView: View {
    //parameter
    var weather: ResponseBody
    
    var body: some View {
        TabView {
            ZStack {
                BackgroundView()
                
                VStack {
                    CityNameView(city: weather.name)
                    
                    var weatherIcon = iconMap[weather.weather[0].main] ?? defaultIcon
                    
                    WeatherTemp(temp: weather.main.temp.roundedDouble(), weatherIcon: weatherIcon)
                    
                    Spacer()
                }
                .padding(.top, 25)
                
                VStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Right Now")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.bottom)
                        
                        HStack {
                            WeatherRow(image: "thermometer.snowflake", name: "Low Temp", val: (weather.main.temp_min.roundedDouble() + "°"))
                            Spacer()
                            
                            WeatherRow(image: "thermometer.sun.fill", name: "High Temp", val: (weather.main.temp_max.roundedDouble() + "°"))
                        }
                        
                        HStack {
                            WeatherRow(image: "wind", name: "Wind", val: (weather.wind.speed.roundedDouble() + "m/s"))
                            Spacer()
                            
                            WeatherRow(image: "humidity", name: "Humidity", val: (weather.main.humidity.roundedDouble() + "%"))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hue: 0.703, saturation: 0.913, brightness: 0.815))
                    .background(.white)
                    .cornerRadius(35, corners: [.allCorners])
                }
                .padding()
                .offset(y: -45)
            }
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
        }
        .ignoresSafeArea()
        //.tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always)) //adjust
    }
}

struct BackgroundView: View {
    
    //@Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(hue: 0.703, saturation: 0.913, brightness: 0.815), .gray]),
                       startPoint: .top,
                       endPoint: .bottom)
        .ignoresSafeArea()
    }
}

struct WeatherTemp: View {
    
    public var temp: String
    public var weatherIcon: String
    
    //@Binding var isNight: Bool
    
    var body: some View {
        //let randomWeather = weather.randomElement()!
        
        VStack(spacing: 24) {
            Image(systemName: weatherIcon)
                .renderingMode(.original)
                //.resizable()
                .aspectRatio(contentMode: .fit)
                .font(.system(size: 170))
                //.frame(width: 170, height: 170)
            
            
            Text(temp + "°")
                .foregroundColor(.white)
                .font(.system(size: 65, weight: .bold))
                .offset(x: 12)
            
        }
    }
}

struct CityNameView: View {
    var city: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(city)
                .foregroundColor(.white)
                .font(.system(size: 40, weight: .bold))
                .padding(.top, 30)
            
            Text("Today, \(Date().formatted(.dateTime.month().day()))")
                .font(.system(size: 20, weight: .medium))
        }
        .padding(.bottom, 0.5)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
