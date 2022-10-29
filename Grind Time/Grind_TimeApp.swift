//
//  Grind_TimeApp.swift
//  Grind Time
//
//  Created by Max BeGole on 10/29/22.
//

import SwiftUI

@main
struct Grind_TimeApp: App {
    @StateObject var dataStore = DataStoreClass()
    //@StateObject var locationDateManager = LocationDataManager(store: $dataStore.store)
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(store: dataStore)
            } .onAppear {
                DataStoreClass.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let store):
                        dataStore.store = store
                    }
                }
            }
        }
    }
}
