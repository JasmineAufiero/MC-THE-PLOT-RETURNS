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
            
            VStack{
//                in  this way we show the pinned section only if the array of pinned medicines is not empty
                if (pinnedMedicines.isEmpty) {
                  
                }
                else {
                   
                Text("In evidenza").fontWeight(.bold).font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                    .padding(.top, 30)
                
                ScrollView(.horizontal){
                    HStack(spacing: 5 ){
                        
                        ForEach(pinnedMedicines) { item in

                            NavigationLink(destination:{SingleMedView(medicine: item, medicineViewModel: medicineViewModel, boxViewModel: boxViewModel)}, label: {MiniMedCardView(name: item.name) .padding(5)})
                                
                            
                        }
                        
                    }
                }.fixedSize(horizontal: false, vertical: false)
                } //close else
                
                
                Text("In scadenza").fontWeight(.bold).font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                
                ScrollView(.horizontal){
                    HStack(spacing: 5 ){
                        ForEach(medicineViewModel.pinnedMedicine() , id: \.self) { item in
                            NavigationLink(destination:{}
                                           //                                                                    SingleMedView()
                                           , label: {MiniMedCardView(name: item.name)
                                .padding(5)})
                            
                        }

//                    ScrollView(.horizontal){
//                        HStack(spacing: 5 ){
//                            ForEach(data, id: \.self) { item in
//                                NavigationLink(destination: SingleMedView(nome: medicine.name, dosaggio: medicine.dosage, tipologia: medicine.type, unità: medicine.units, categoria: medicine.category, medicineViewModel: medicineViewModel, boxViewModel: boxViewModel), label: {MiniMedCardView()
//                                    .padding(5)})
//
//                            }
//                        }
                                                }
                       }.fixedSize(horizontal: false, vertical: false)
                                                    
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
