//
//  ViewRouter.swift
//  Grind Time
//
//  Created by Max BeGole on 10/29/22.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    var currentPage: String = "homeView" {
        didSet {
            objectWillChange.send(self)
        }
    }
    /*
    var homePage: String = "assignments" {
        didSet {
            objectWillChange.send(self)
        }
    }
     */
}
