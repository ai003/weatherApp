//
//  WeatherRow.swift
//  WeatherApp
//
//  Created by Alvin Ishimwe on 9/5/22.
//

import SwiftUI

struct WeatherRow: View {
    var image: String
    var name: String
    var val: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: image)
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .font(.system(size: 30))
                .frame(width: 30, height: 30)
                .padding()
                .background(Color(hue: 0.703, saturation: 0.338, brightness: 0.821, opacity: 0.998))
                .cornerRadius(50)
            
            VStack (alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.body)
                
                Text(val)
                    .bold()
                    .font(.title)
                    
                    
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(image: "thermometer", name: "Feels Like", val: "10°")
    }
}
