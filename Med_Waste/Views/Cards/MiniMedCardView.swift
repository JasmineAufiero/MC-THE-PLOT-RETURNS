//
//  MiniMedCardView.swift
//  MedWaste
//
//  Created by Irene Fernando on 29/05/22.
//

import SwiftUI

struct MiniMedCardView: View {
    var name :String
    
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(CustomColor.medcardgray)
                .frame(width: 120, height: 150, alignment: .center)

            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            .overlay( VStack(alignment: .center, spacing: 10){
                Image("pills").resizable().scaledToFit()
               
              
                Text(name).font(.subheadline).fontWeight(.bold).textCase(.uppercase)
                     }.padding().foregroundColor(CustomColor.graytext))
       
        
    }

    }
}

//struct MiniMedCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        MiniMedCardView()
//    }
//}
