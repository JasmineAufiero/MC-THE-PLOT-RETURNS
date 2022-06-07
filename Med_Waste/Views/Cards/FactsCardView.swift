//
//  FactsCardView.swift
//  MedWaste
//
//  Created by Irene Fernando on 29/05/22.
//

import SwiftUI

struct FactsCardView: View {
    var body: some View {
        
            Text("“One billion tablets are wasted each year because families buy a bigger quantity then needed”").font(.subheadline).fontWeight(.bold)
                .multilineTextAlignment(.center) .padding(35)  .background(CustomColor.darkblue)
                .cornerRadius(33)
                      

    }
}

struct FactsCardView_Previews: PreviewProvider {
    static var previews: some View {
        FactsCardView()
    }
}
