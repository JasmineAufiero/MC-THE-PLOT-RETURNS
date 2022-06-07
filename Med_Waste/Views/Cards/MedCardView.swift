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
                .fixedSize(horizontal: false, vertical: false)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            VStack(alignment: .center, spacing: 10){
                
                // modified: dynamic change of the card
                Image("pills").resizable().scaledToFit() // add a method in the ViewModel that define the image based on the type
                RoundedRectangle(cornerRadius: 20).fixedSize(horizontal: false, vertical: true)
                HStack{
                    Text(medname).font(.title3).fontWeight(.bold).textCase(.uppercase)
                    Spacer()
                    Text (dosage)
                }
                HStack{
                    Text(medCategory)
                    Spacer()
                }
                
            }.padding()
            
        }
    }
}

struct MedCardView_Previews: PreviewProvider {
    static var previews: some View {
        MedCardView(medname: "Ayrinal", dosage: "20mg", medCategory: "Antistaminico")
    }
}
