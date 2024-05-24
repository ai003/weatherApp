//
//  WelcomePage.swift
//  WeatherApp
//
//  Created by Alvin Ishimwe on 8/28/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomePage: View {
    //variable for object parameter
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            //welcome texts
            VStack(spacing: 20) {
                Text("Welcome to the Weather App")
                    .bold().font(.title)
                
                Text("Please share your current location to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            //Button that enables the user to share location
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
