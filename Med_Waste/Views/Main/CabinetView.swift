//
//  CabinetView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is the CabinetView the 2nd component of the Tab bar

import SwiftUI

struct CabinetView: View {
    
    @State var searchQuery = ""
    @State private var showScanner = false
    @State private var showMap = false
    @State public var showData = false
    @State private var isRecognizing = false
    @State var pinnedMedicineNumber :Int
    @State var SearchviewMedVar : String = ""
    
    var medicineViewModel :MedicineViewModel
    var boxViewModel :BoxViewModel
    @ObservedObject var recognizedContent = RecognizedContent()
    
//    let data = (1...10).map { "Item \($0)" }
    let columns = [
        GridItem(.flexible(minimum: 90)),
        GridItem(.flexible(minimum: 90))
    ]

    var filteredMeds :[MedData] {
        if searchQuery.isEmpty{
            return medicineViewModel.medicines
        }else if searchQuery == SearchviewMedVar {
            return medicineViewModel.medicines.filter{$0.category.localizedCaseInsensitiveContains(searchQuery)}
          
        } else {
            return medicineViewModel.medicines.filter{$0.name.localizedCaseInsensitiveContains(searchQuery)}
        }
    }
    

    var body: some View {
        
        NavigationView{
            ScrollView {
                
            VStack{
                Text("Tutti i medicinali").fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                // modified: add a dynamic card
                LazyVGrid(columns: columns, spacing: 20) {
                    
                    ForEach(filteredMeds) { item in
                        
                        NavigationLink(destination:
                                        SingleMedView(medicine: item, medicineViewModel: medicineViewModel, boxViewModel: boxViewModel)
//                                            nome: item.name, dosaggio: item.dosage, tipologia: item.type, prezzo: item.price, unità: item.units, categoria: item.category, isPinned: item.isPinned, medicineViewModel: medicineViewModel, boxViewModel: boxViewModel)
                        ) {
                            
                            MedCardView(
                                medicine: item)
//                            , medname: item.name, dosage: item.dosage, medCategory: item.category)
                                .padding(5)
                            }
                        }
                    }.searchable(text: $searchQuery, prompt: "Cerca i medicinali")
                {
                    if searchQuery.isEmpty{
                        SearchView(medicineViewModel: medicineViewModel, boxViewModel: boxViewModel)
//                                   searchForCategory: SearchviewMedVar)
                    }
                
                }
                }
            }
            
            .navigationTitle("Armadietto")
            .navigationBarItems(trailing:
                                    HStack(spacing: 20){
                Button(action: { showMap = true }, label: { Image(systemName: "map.circle.fill").scaleEffect(1.5)})
                
//                Button(action: {guard !isRecognizing else { return }
//                    showScanner = true ; showData = true }, label: { Image(systemName: "plus.circle.fill").foregroundColor(CustomColor.darkblue).scaleEffect(1.5)})
                
//                new button that redirects to the view for adding a new item
                Button(action: {
                    showData.toggle()
                }) {
                    
                        Image(systemName: "plus.circle.fill").foregroundColor(CustomColor.darkblue).scaleEffect(1.5)
                    
                }
            })
        }
        
//        .sheet(isPresented: $showScanner) { // modified: add new medicine sheet
//            NewItemView(medicineViewModel: medicineViewModel, boxViewModel: boxViewModel)
//        }

//        .sheet(isPresented: $showMap, content: {MapView()})
//            .sheet(isPresented: $showScanner, content: {
//                ScanView{ result in
//                    switch result{
//                    case .success(let scannedImages):
//                        isRecognizing = true
//                        RecognizeText(scannedImages: scannedImages, recognizedContent: recognizedContent){
//                            isRecognizing = false
//                            showScanner = false
//                            showData = true
//                        }.recognizeText()
//
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    }
//                    showScanner = false
//                } didCancelScanning: {showScanner = false}
//
//            })
        .sheet(isPresented: $showData, content: {NewItemView( showData : $showData ,medicineViewModel: medicineViewModel, boxViewModel: boxViewModel)})

    }
}

//struct CabinetView_Previews: PreviewProvider {
//    static var previews: some View {
//        CabinetView()
//    }
//}
