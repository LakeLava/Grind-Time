//
//  storetore.swift
//  Grind Time
//
//  Created by Nick DiGennaro on 10/29/22.
//

import MapKit
import CoreLocation
import Foundation
import SwiftUI

class DataStoreClass: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var store: DataStore = DataStore()

    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("store.data")
    }
    
    static func load(completion: @escaping (Result<DataStore, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success(DataStore()))
                    }
                    return
                }
                let DataStores = try JSONDecoder().decode(DataStore.self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(DataStores))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(store: [DataStore], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(store)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(store.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    // Malia's work, Adrian's fault
    var locationManager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus?
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.676975, longitude: -82.836354), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:  // Location services are available.
            // Insert code here of what should happen when Location services are authorized
            authorizationStatus = .authorizedWhenInUse
            locationManager.requestLocation()
            break
            
        case .restricted:  // Location services currently unavailable.
            // Insert code here of what should happen when Location services are NOT authorized
            authorizationStatus = .restricted
            break
            
        case .denied:  // Location services currently unavailable.
            // Insert code here of what should happen when Location services are NOT authorized
            authorizationStatus = .denied
            break
            
        case .notDetermined:        // Authorization not determined yet.
            authorizationStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
            break
            
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Insert code to handle location updates
        if let location = locations.last {
            print("New location is \(location)")
        }
        self.store.locationHistories.append(
            DataStore.LocationHistory(coordinate: CLLocationCoordinate2D(latitude: 34.676975, longitude: -82.836354), date: Date.now)
        )
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }

}

