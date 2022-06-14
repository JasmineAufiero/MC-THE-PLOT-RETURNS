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
                Text(LocalizedStringKey(String("In evidenza"))).fontWeight(.bold).font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                    .padding(.top, 30)

                if (pinnedMedicines.isEmpty) {
                    
                  InEvidenzaPlaceholderPinned()
                        .padding(.leading, 20)
                  
                }
                else {
                ScrollView(.horizontal){
                    HStack(spacing: 5 ){
                        
                        ForEach(pinnedMedicines.reversed()) { item in

                            NavigationLink(destination:{SingleMedView(medicine: item, medicineViewModel: medicineViewModel, boxViewModel: boxViewModel)}, label: {MiniMedCardView(medicine: item , name: item.name)    .padding(.leading, 20)})
                                
                            
                        }
                        
                    }
                }.fixedSize(horizontal: false, vertical: false)
                } //close else
                
                
                Text(LocalizedStringKey(String("In scadenza"))).fontWeight(.bold).font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                InEvidenzaPlaceholderAboutToExpire()
                    .padding(.leading, 20)
                
//                ScrollView(.horizontal){
//                    HStack(spacing: 5 ){
////                        ForEach(medicineViewModel.pinnedMedicine() , id: \.self) { item in
////                            NavigationLink(destination:{}
////                                           //                                                                    SingleMedView()
////                                           , label: {MiniMedCardView(name: item.name)
////                                .padding(5)})
////
////                        }
//
//
////                    ScrollView(.horizontal){
////                        HStack(spacing: 5 ){
////                            ForEach(data, id: \.self) { item in
////                                NavigationLink(destination: SingleMedView(nome: medicine.name, dosaggio: medicine.dosage, tipologia: medicine.type, unità: medicine.units, categoria: medicine.category, medicineViewModel: medicineViewModel, boxViewModel: boxViewModel), label: {MiniMedCardView()
////                                    .padding(5)})
////
////                            }
////                        }
//                                                }
//                       }.fixedSize(horizontal: false, vertical: false)
                                                    
                                                    Text(LocalizedStringKey(String("Curiosità"))).fontWeight(.bold).font(.title3)
                                                        .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                                                    
                                                    FactsCardView().frame(width: UIScreen.screenWidth - 30, height: 140, alignment: .center).padding()
                                                    Spacer()
                                                    
                                                }.navigationTitle(LocalizedStringKey(String("Riepilogo")))
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
