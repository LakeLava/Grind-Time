//
//  ContentView.swift
//  Grind Time
//
//  Created by Max BeGole on 10/29/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var store: DataStore
    @ObservedObject var viewRouter = ViewRouter()

    var body: some View {
        VStack {
            switch viewRouter.currentPage {
            case "mapView":
                //MapView(viewRouter: viewRouter)
                MapView()
            case "userView":
                UserView(store: $store)
            default:
                HomeView(store: $store)
            }
            NavMenuView(viewRouter: viewRouter)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: .constant(DataStore.sampleData), viewRouter: ViewRouter())
    }
}
