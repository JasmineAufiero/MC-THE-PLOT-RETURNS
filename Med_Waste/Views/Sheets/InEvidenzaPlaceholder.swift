//
//  InEvidenzaPlaceholder.swift
//  Med_Waste
//
//  Created by Rosa Cimmino on 13/06/22.
//

import SwiftUI

struct InEvidenzaPlaceholderPinned: View {
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(CustomColor.medcardgray)
                .frame(width: 120, height: 150, alignment: .center)

            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            .overlay( VStack(alignment: .center, spacing: 10){
                Image(systemName: "heart.fill").resizable().scaledToFit()
                    .grayscale(1)
                    .opacity(0.2)
                }.padding(25)
                .foregroundColor(CustomColor.graytext))
       
        
    }

    }
}

struct InEvidenzaPlaceholderAboutToExpire: View {
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(CustomColor.medcardgray)
                .frame(width: 120, height: 150, alignment: .center)

            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            .overlay( VStack(alignment: .center, spacing: 10){
                Image(systemName: "calendar.badge.clock").resizable().scaledToFit()
                    .grayscale(1)
                    .opacity(0.2)
                }.padding(25)
                .foregroundColor(CustomColor.graytext))
       
        
    }

    }
}

struct InEvidenzaPlaceholderAboutToExpire_Previews: PreviewProvider {
    static var previews: some View {
        InEvidenzaPlaceholderAboutToExpire()
    }
}
