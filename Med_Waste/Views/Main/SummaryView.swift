//
//  SummaryView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is the SummaryView the 1st component of the Tab bar


import SwiftUI

struct SummaryView: View {
    let data = (1...10).map { "Item \($0)" }
    
    var body: some View {
        NavigationView{
            
            VStack{
                Text("In evidenza").fontWeight(.bold).font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                
                ScrollView(.horizontal){
                    HStack(spacing: 5 ){
                        ForEach(data, id: \.self) { item in
                            NavigationLink(destination:{}
//                                                                        SingleMedView()
                                                                       , label: {MiniMedCardView() .padding(5)})
                            
                            
                        }
                    }
                }.fixedSize(horizontal: false, vertical: false)
                
                Text("In scadenza").fontWeight(.bold).font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                
                ScrollView(.horizontal){
                    HStack(spacing: 5 ){
                                                ForEach(data, id: \.self) { item in
                                                    NavigationLink(destination:{}
//                                                                    SingleMedView()
                                                                   , label: {MiniMedCardView()
                                                        .padding(5)})
                        
                    }
                }
            }.fixedSize(horizontal: false, vertical: false)
            
            Text("Curiosità").fontWeight(.bold).font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
            
            FactsCardView().frame(width: UIScreen.screenWidth - 30, height: 150, alignment: .center).padding()
            Spacer()
            
        }.navigationTitle("Riepilogo")
    }
    
}
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
