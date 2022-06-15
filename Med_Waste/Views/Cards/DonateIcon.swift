//
//  DonateIcon.swift
//  MedWaste
//
//  Created by Irene Fernando on 03/06/22.
//

import SwiftUI

struct DonateIcon: View {
    var body: some View {
        ZStack{
            Image(systemName: "hand.wave.fill")
            Image(systemName: "pills.fill").scaleEffect(0.4).offset(x:3, y: -9)
            
        }
        
    }
}

struct DonateIcon_Previews: PreviewProvider {
    static var previews: some View {
        DonateIcon()
    }
}
