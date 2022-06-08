//
//  SummaryView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is the SummaryView the 1st component of the Tab bar


import SwiftUI

struct SummaryView: View {
    var medicineViewModel :MedicineViewModel
    var boxViewModel :BoxViewModel
    
    
    let data = (1...10).map { "Item \($0)" }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Text("In evidenza").font(.title3).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                    ScrollView(.horizontal){
                        HStack(spacing: 5 ){
//                            ForEach(0..<pinnedMedicineNumber) { index in
//
//                                NavigationLink(destination: SingleMedView(nome: medicineViewModel.pinnedMedicines[index].name, dosaggio: medicineViewModel.pinnedMedicines[index].dosage, tipologia: medicineViewModel.pinnedMedicines[index].type, prezzo: medicineViewModel.pinnedMedicines[index].price, unità: medicineViewModel.pinnedMedicines[index].units, categoria: medicineViewModel.pinnedMedicines[index].category, pinnedMedicineNumber: $pinnedMedicineNumber, medicineViewModel: medicineViewModel, boxViewModel: boxViewModel), label: {MiniMedCardView(name: medicineViewModel.pinnedMedicines[index].name) .padding(5)})
//
//                            }
                        }
                    }
                    .fixedSize(horizontal: false, vertical: false)
                        
                    Text("In scadenza").font(.title3).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)

                    DonateIcon()

//                    ScrollView(.horizontal){
//                        HStack(spacing: 5 ){
//                            ForEach(data, id: \.self) { item in
//                                NavigationLink(destination: SingleMedView(nome: medicine.name, dosaggio: medicine.dosage, tipologia: medicine.type, unità: medicine.units, categoria: medicine.category, medicineViewModel: medicineViewModel, boxViewModel: boxViewModel), label: {MiniMedCardView()
//                                    .padding(5)})
//
//                            }
//                        }
//                    }.fixedSize(horizontal: false, vertical: false)
                    Text("Curiosità").font(.title3).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                    ScrollView(.horizontal){
                        HStack( ){
                            ForEach(data, id: \.self) { item in
                                FactsCardView().frame(width: 350)

                            }
                        }
                    }
                    
                }.navigationTitle("Riepilogo")
            }
        }
    }
}

//struct SummaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SummaryView()
//    }
//}
