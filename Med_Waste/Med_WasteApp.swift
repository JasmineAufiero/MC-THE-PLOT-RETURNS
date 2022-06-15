//
//  Med_WasteApp.swift
//  Med_Waste
//
//  Created by Jasmine Aufiero on 07/06/22.
//

import SwiftUI

@main
struct Med_WasteApp: App {
    
    @StateObject var locationManagerK = MapViewModel()
    
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(locationManagerK)
        }
    }
}
