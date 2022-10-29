//
//  Grind_TimeApp.swift
//  Grind Time
//
//  Created by Max BeGole on 10/29/22.
//

import SwiftUI

@main
struct Grind_TimeApp: App {
    @StateObject var store = DataStoreClass()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(scrums: $store.scrums)
            } .onAppear {
                DataStoreClass.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let scrums):
                        store.scrums = scrums
                    }
                }
            }
        }
    }
}
