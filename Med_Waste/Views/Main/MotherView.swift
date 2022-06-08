//
//  MotherView.swift
//  Med_Waste
//
//  Created by Rosa Cimmino on 08/06/22.
//

import SwiftUI

//the mother view manages the switch between the onboarding and the normal content view when it's noth the first launch of the app
struct MotherView : View {
        
    @AppStorage("normalApp") var notFirstTime: Bool = false  //deve esssere false per funzionare
    
    var body: some View {
        ZStack{
            if notFirstTime {
                ContentView()
            } else {
                Onboarding(onboarding: $notFirstTime)
            }
        }
    
    }
}

