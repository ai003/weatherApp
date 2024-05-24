//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Alvin Ishimwe on 8/28/22.
//

import Foundation
import CoreLocation

//location mangager class and what is has to conform too
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()//manager var
    
    //optional because you might not get user location
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    //inizitial class
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    //did update locations function
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //saving location in variable
        location = locations.first?.coordinate//gets first of array of locations
        isLoading = false // got locations so the state is not loading anymore
        
    }
    //func to handle errors
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
    
}
