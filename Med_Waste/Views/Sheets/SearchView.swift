//
//  SearchView.swift
//  MedWaste
//
//  Created by Irene Fernando on 07/06/22.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Stato")
                .font(.title).fontWeight(.semibold)
            HStack{
                
                Button{}label: {
                    HStack{
                        Image(systemName: "trash.fill")
                        Text("Scaduti")
                        
                    }.padding()
                        .background(CustomColor.expiredred)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
                
                Button{}label: {
                    HStack{
                        
                        DonateIcon()
                        Text("Donabili")
                        
                    }.padding()
                        .background(CustomColor.donnatedgreen)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
                
            }
            Text("Categoria").font(.title).fontWeight(.semibold)
            HStack{
                Button{}label: {
                    
                    
                    Text("Antistaminici")
                        .padding()
                        .background(Color.systemOrange)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                }
                Button{}label: {
                    
                    Text("Antibiotici")
                        .padding()
                        .background(Color.systemTeal)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                }
                Button{}label: {
                    
                    Text("Antibiotici")
                        .padding()
                        .background(Color.systemPurple)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                }
            }
            HStack{
                Button{}label: {
                    Text("Antidolorifici")
                        .padding()
                        .background(Color.systemBlue)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                }
                
            }
        }.navigationTitle("Tutti i medicinali")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
