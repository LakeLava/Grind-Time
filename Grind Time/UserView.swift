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
            Text("Grind Time Account")
                .font(.title .weight(.bold)).padding ()

            
            Image("myGraph").resizable()
                .frame(width: 300.0, height: 220.0).padding(50)
            
            Text("You have spent the most time in **Cooper Library!**")
                .font(.title2).padding () .background(.black) .foregroundColor(.white)
            Text("You have spent **16 hours** in total")
                .font(.title2).padding () .background(.black) .foregroundColor(.white)
            
            Spacer()
        }
        
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
