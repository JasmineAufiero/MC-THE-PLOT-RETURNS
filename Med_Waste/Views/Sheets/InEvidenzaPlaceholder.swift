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

struct PlaceholderMedicine: View {
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(CustomColor.medcardgray)
                .fixedSize(horizontal: false, vertical: false)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            VStack(alignment: .center, spacing: 10){
                
                // modified: dynamic change of the card
                Image("pillolagrigio").resizable().scaledToFit().padding()
                // add a method in the ViewModel that define the image based on the type
                RoundedRectangle(cornerRadius: 20).fixedSize(horizontal: false, vertical: false).frame( height: 5 , alignment: .center).foregroundColor(CustomColor.graytext)
                HStack{
                    Text(LocalizedStringKey(String("Nome"))).font(.title3).fontWeight(.bold).textCase(.uppercase)
                        .scaledToFit()
                            .minimumScaleFactor(0.01)
                            .lineLimit(1)
                    Spacer()
                    Text (LocalizedStringKey(String("Dosaggio"))).font(.subheadline)
                }
                HStack{
                    Text(LocalizedStringKey(String("Categoria")))
                    Spacer()
                }
                
            }.padding(10).foregroundColor(CustomColor.graytext)
                .frame(width: 180, height: 300, alignment: .center)
            
        }

    }
}



//struct PlaceholderMedicine_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceholderMedicine()
//    }
//}
