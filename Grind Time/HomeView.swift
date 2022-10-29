//
//  HomeView.swift
//  Grind Time
//
//  Created by Max BeGole on 10/29/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var store: DataStoreClass

    var body: some View {
        VStack {
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, Max!")
            MapView(store: store)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(store: DataStoreClass())
    }
}
