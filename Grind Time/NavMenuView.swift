//
//  NavMenuView.swift
//  Grind Time
//
//  Created by Max BeGole on 10/29/22.
//

import SwiftUI

struct NavMenuView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var width: CGFloat = 40
    var height: CGFloat = 40
    
    var body: some View {
        HStack() {
            Button(action: {viewRouter.currentPage = "assignments"}) {
                Image(systemName: "house")
                    .resizable()
                    .frame(width: width, height: height)
            }.frame(maxWidth: .infinity)
            Button(action: {viewRouter.currentPage = "announcements"}) {
                Image(systemName: "list.star")
                    .resizable()
                    .frame(width: width, height: height)
            }.frame(maxWidth: .infinity)
            Button(action: {viewRouter.currentPage = "menu"}) {
                Image(systemName: "map")
                    .resizable()
                    .frame(width: width, height: height)
            }.frame(maxWidth: .infinity)
            Button(action: {viewRouter.currentPage = "clubs"}) {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: width, height: height)
            
            }.frame(maxWidth: .infinity)
        }.padding()
            .frame(minWidth: 0, maxWidth: 350, minHeight: 0, maxHeight: 50, alignment: .center)
            //.border(Color.black, width: 1)
    }
}

struct NavMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavMenuView(viewRouter: ViewRouter())
    }
}
