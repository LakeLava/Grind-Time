//
//  UserView.swift
//  Grind Time
//
//  Created by Nick DiGennaro on 10/29/22.
//

import SwiftUI

struct UserView: View {
    @Binding var store: DataStore

    var body: some View {
        VStack {
            // Print all location histories to screen, ensuring they exist
            ForEach(store.locationHistories) {lh in
                Text("\(lh.date)")
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(store: .constant(DataStore.sampleData))
    }
}
