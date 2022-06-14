//
//  SummaryView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is the SummaryView the 1st component of the Tab bar


import SwiftUI

struct SummaryView: View {
    @ObservedObject var medicineViewModel :MedicineViewModel
    var boxViewModel :BoxViewModel
    
    //    @State var pinnedMedicine :[MedData] = []
    
    
    let data = (1...10).map { "Item \($0)" }
    
    var pinnedMedicines :[MedData] {
        return medicineViewModel.medicines.filter{$0.isPinned}
        
    }
    
    var body: some View {
        NavigationView{
            
            VStack (alignment: .leading){
                Text("In evidenza").fontWeight(.bold).font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                    .padding(.top, 30)
                
                if (pinnedMedicines.isEmpty) { // when there aren't any pinned medicine, add the placeholder
                    
                    InEvidenzaPlaceholderPinned()
                        .padding(.leading, 20)
                    
                }
                else { // add the pin med when someone of them is pinned
                    ScrollView(.horizontal){
                        HStack(spacing: 5 ){
                            
                            ForEach(pinnedMedicines.reversed()) { item in
                                
                                NavigationLink(destination:{SingleMedView(medicine: item, medicineViewModel: medicineViewModel, boxViewModel: boxViewModel)}, label: {MiniMedCardView(medicine: item , name: item.name)
                                    .padding(.leading, 20)})
                                
                            }
                            
                        }
                    }.fixedSize(horizontal: false, vertical: false)
                } //close else
                
                
                Text("In scadenza").fontWeight(.bold).font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                
                if boxViewModel.filterAboutToExpireBoxes().isEmpty { // when there aren't any about to expire medicine, add the placeholder
                    InEvidenzaPlaceholderAboutToExpire()
                        .padding(.leading, 20)
                }
                else {
                    ScrollView(.horizontal){
                        HStack(spacing: 5 ){
                            ForEach(medicineViewModel.filterMedicinesFromBoxes(boxes: boxViewModel.filterAboutToExpireBoxes())) { item in
                                NavigationLink(destination:{SingleMedView(medicine: item, medicineViewModel: medicineViewModel, boxViewModel: boxViewModel)}, label: {MiniMedCardView(medicine: item , name: item.name)
                                    .padding(.leading, 20)})
                            }
                        }
                    }.fixedSize(horizontal: false, vertical: false)
                }
                
                
                
                Text("Curiosità").fontWeight(.bold).font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                
                FactsCardView().frame(width: UIScreen.screenWidth - 30, height: 140, alignment: .center).padding()
                Spacer()
                
            }.navigationTitle("Riepilogo")
        }
        //            .onAppear(perform: {
        //                pinnedMedicine = medicineViewModel.medicines.filter{$0.isPinned}
        //            })
    }
}



//struct SummaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SummaryView()
//    }
//}
