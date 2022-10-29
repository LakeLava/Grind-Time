//
//  UserView.swift
//  Grind Time
//
//  Created by Nick DiGennaro on 10/29/22.
//

import SwiftUI

struct UserView: View {
    @Binding var scrums: [DataStore]

    var body: some View {
        VStack {
            ForEach(scrums) { scrum in
                ForEach(scrum.locationHistories) {lh in
                    Text("\(lh.date)")
                }
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(scrums: .constant(DataStore.sampleData))
    }
}
