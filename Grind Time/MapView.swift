//
//  MapView.swift
//  MyGoogleMapsExample
//
//  Created by Max BeGole on 10/28/22.
//
import MapKit
import SwiftUI
import CoreLocation
import Foundation

struct MapView: View {
    @StateObject var store: DataStoreClass
    
    var body: some View {
        VStack {
            switch store.locationManager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                // Insert code here of what should happen when Location services are authorized
                Text("Your current location is:")
                Text("Latitude: \(store.locationManager.location?.coordinate.latitude.description ?? "Error loading")")
                Text("Longitude: \(store.locationManager.location?.coordinate.longitude.description ?? "Error loading")")
                
            case .restricted, .denied:  // Location services currently unavailable.
                // Insert code here of what should happen when Location services are NOT authorized
                Text("Current location data was restricted or denied.")
            case .notDetermined:        // Authorization not determined yet.
                Text("Finding your location...")
                ProgressView()
            default:
                ProgressView()
            }
            Map(coordinateRegion: $store.region, showsUserLocation:  true).ignoresSafeArea().accentColor(Color(.systemPink))
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(store: DataStoreClass())
    }
}
