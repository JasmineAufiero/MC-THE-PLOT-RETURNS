//
//  MedCardView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view serves as the basic structure of the medicine card in the CabinetView
// VStack : Image, HStack (Name of med, Dosage) ,Type of med

import SwiftUI

struct MedCardView: View {
    // modified: add parameters
    var medname :String
    var dosage :String
    var medCategory :String
//    var image :String // add a parameter that can be used as image
    
    var body: some View {
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(CustomColor.medcardgray)
//                .frame(width: <#T##CGFloat?#>, height: <#T##CGFloat?#>, alignment: <#T##Alignment#>)
                .fixedSize(horizontal: false, vertical: false)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            VStack(alignment: .center, spacing: 10){
                
                // modified: dynamic change of the card
                Image("pills").resizable().scaledToFit().padding()
                // add a method in the ViewModel that define the image based on the type
                RoundedRectangle(cornerRadius: 20).fixedSize(horizontal: false, vertical: false).frame( height: 5 , alignment: .center).foregroundColor(Color.systemOrange)
                HStack{
                    Text(medname).font(.title3).fontWeight(.bold).textCase(.uppercase)
                        .scaledToFit()
                            .minimumScaleFactor(0.01)
                            .lineLimit(1)
                    Spacer()
                    Text (dosage).font(.subheadline)
                }
                HStack{
                    Text(medCategory.capitalizingFirstLetter())
                    Spacer()
                }
                
            }.padding(10).foregroundColor(CustomColor.graytext)
                .frame(width: 180, height: 300, alignment: .center)
            
        }
    }
}

struct MedCardView_Previews: PreviewProvider {
    static var previews: some View {
        MedCardView(medname: "Tachipirina", dosage: "20mg", medCategory: "Antistaminico")
    }
}
