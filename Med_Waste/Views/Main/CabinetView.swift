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
    @State private var showData = false
    @State private var isRecognizing = false
    @State var pinnedMedicineNumber :Int
    @State var searchForCategory : Bool = false
    @State private var recognizedText = ""
    
    @EnvironmentObject var locationManagerK : MapViewModel
    var medicineViewModel :MedicineViewModel
    var boxViewModel :BoxViewModel
    var statsViewModel :StatsViewModel
//    @ObservedObject var recognizedContent = RecognizedContent()
    

    let columns = [
        GridItem(.flexible(minimum: 90)),
        GridItem(.flexible(minimum: 90))
    ]

    var filteredMeds :[MedData] {
        if searchQuery.isEmpty{
            return medicineViewModel.medicines
        } else {
            if (searchForCategory) {
                return medicineViewModel.medicines.filter{$0.category.localizedCaseInsensitiveContains(searchQuery)}
            } else {
                return medicineViewModel.medicines.filter{$0.name.localizedCaseInsensitiveContains(searchQuery)}
            }
        }
    }
    
//    localized string keys
    

    var body: some View {
        
        NavigationView{
            ScrollView {
                
            VStack{
                Text(LocalizedStringKey(String("Tutti i farmaci"))).fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                // modified: add a dynamic card
                
                
                
                
                LazyVGrid(columns: columns, spacing: 20) {
                    if (medicineViewModel.medicines.isEmpty) {
                        
                      PlaceholderMedicine()
                            .padding(.leading, 20)
                      
                    }else{
                    ForEach(filteredMeds.reversed()) { item in
                        
                        NavigationLink(destination:
                                        SingleMedView(medicine: item, medicineViewModel: medicineViewModel, boxViewModel: boxViewModel,statsViewModel: statsViewModel )
//                                            nome: item.name, dosaggio: item.dosage, tipologia: item.type, prezzo: item.price, unità: item.units, categoria: item.category, isPinned: item.isPinned, medicineViewModel: medicineViewModel, boxViewModel: boxViewModel)
                        ) {
                            
                            MedCardView(
                                medicine: item)
//                            , medname: item.name, dosage: item.dosage, medCategory: item.category)
                                .padding(5)
                            }
                        }
                    }
                    }.searchable(text: $searchQuery, prompt: LocalizedStringKey(String("Cerca i medicinali")))
                    
                {
                    if searchQuery.isEmpty {
//                        SearchView(medicineViewModel: medicineViewModel, boxViewModel: boxViewModel)
////                                   searchForCategory: SearchviewMedVar)
                     
                       
                        
                        
                        VStack(alignment: .leading, spacing: 10){
                            Text("Stato")
                                .font(.title).fontWeight(.semibold)
                            HStack{
                                
                                Button{
                //                    search for expired meds
                                    
                                    
                                    
                                }label: {
                                    HStack{
                                        Image(systemName: "trash.fill")
                                        Text(LocalizedStringKey(String("Scaduti")))
                                        
                                    }.padding()
                                        .background(CustomColor.expiredred)
                                        .foregroundColor(.white)
                                        .cornerRadius(40)
                                }
                                
                                Button{
                //                    search for donable meds
                                }label: {
                                    HStack{
                                        
                                        DonateIcon()
                                        Text(LocalizedStringKey(String("Donabili")))
                                        
                                    }.padding()
                                        .background(CustomColor.donnatedgreen)
                                        .foregroundColor(.white)
                                        .cornerRadius(40)
                                }
                                
                            }
                            Toggle(isOn: $searchForCategory) {
                                Text(LocalizedStringKey(String("Categoria"))).font(.title).fontWeight(.semibold)
                            }
                             //most used categories
                            if searchForCategory{
                                HStack{
                                    Button{
                                        } label: {
                                        
                                        Text("Antibiotici")
                                            .padding()
                                            .background(Color("arancione"))
                                            .cornerRadius(40)
                                            .foregroundColor(.white)
                                    }
                                        .onTapGesture{
                                            searchQuery = "Antibiotici"
                                        }
                                    
                                    Button{
                                    }label: {
                                        
                                        Text("Dermatologici")
                                            .padding()
                                            .background(Color("viola"))
                                            .cornerRadius(40)
                                            .foregroundColor(.white)
                                    }
                                    .onTapGesture{
                                        searchQuery = "Dermatologici"
                                    }
                                    
                                    Button {
                                    } label: {
                                        Text("Integratori")
                                            .padding()
                                            .background(Color("giallo"))
                                            .cornerRadius(40)
                                            .foregroundColor(.white)
                                    }
                                    .onTapGesture{
                                        searchQuery = "Integratori"
                                    }
                                }
                                HStack{
                                    Button{
                                        } label: {
                                        
                                        Text("Anti-Infiammatori")
                                            .padding()
                                            .background(Color("nero"))
                                            .cornerRadius(40)
                                            .foregroundColor(.white)
                                    }
                                        .onTapGesture{
                                            searchQuery = "Anti-Infiammatori"
                                        }
                                    
                                    Button {
                                    }label: {
                                        
                                        Text("Gastrointestinali")
                                            .padding()
                                            .background(Color("verde"))
                                            .cornerRadius(40)
                                            .foregroundColor(.white)
                                    }
                                    .onTapGesture{
                                        searchQuery = "Gastrointestinali"
                                    }
                                    
                                    
                                }
                            HStack{
                                Button{
                                    } label: {
                                    
                                    Text(LocalizedStringKey(String("Antistaminici")))
                                        .padding()
                                        .background(Color("blu"))
                                        .cornerRadius(40)
                                        .foregroundColor(.white)
                                }
                                    .onTapGesture{
                                        searchQuery = "Antistaminici"
                                    }
                                Button{
                                }label: {
                                    
                                    Text(LocalizedStringKey(String("Integratori")))
                                        .padding()
                                        .background(Color("giallo"))
                                        .cornerRadius(40)
                                        .foregroundColor(.white)
                                }
                                .onTapGesture{
                                    searchQuery = "Integratori"
                                }
                            }
                            HStack{
                                Button {
                                }label: {
                                    
                                    Text(LocalizedStringKey(String("Gastrointestinali")))
                                        .padding()
                                        .background(Color("verde"))
                                        .cornerRadius(40)
                                        .foregroundColor(.white)
                                }
                                .onTapGesture{
                                    searchQuery = "Gastrointestinali"
                                }
                               
                           
                                Button {    
                                } label: {
                                    Text(LocalizedStringKey(String("Antidolorifici")))
                                        .padding()
                                        .background(Color("rosso"))
                                        .cornerRadius(40)
                                        .foregroundColor(.white)
                                }
                                .onTapGesture{
                                    searchQuery = "Antidolorifici"
                                }
                                
                                
                                
                                Button{
                                }label: {
                                    
                                    Text("Antivirali")
                                        .padding()
                                        .background(Color("verde"))
                                        .cornerRadius(40)
                                        .foregroundColor(.white)
                                }
                                .onTapGesture{
                                    searchQuery = "Antivirali"
                                }
                          
                               
                           
                               
                                
                                
                            }
                                Spacer()

                        }
                        }
//                        .onDisappear{
//                            searchForCategory = false
//                        }
//
                        
                        
                        
                    

                }
                }
                
                if showData{
                Text(recognizedText)
                    .font(.system(size: 5))
                }
//                .onAppear{
//                    searchForCategory = false
//                }
                }
            }
            .onAppear{
                statsViewModel.statValue(currentvalue: statsViewModel.stats[0].value)
            }
            
            
            
            
            .navigationTitle(LocalizedStringKey(String("Armadietto")))
            .navigationBarItems(trailing:
                                    HStack(spacing: 20){
                Button(action: { locationManagerK.showMap = true }, label: { Image(systemName: "map.circle.fill").scaleEffect(1.5)})
                
//                Button(action: {guard !isRecognizing else { return }
//                    showScanner = true ; showData = true }, label: { Image(systemName: "plus.circle.fill").foregroundColor(CustomColor.darkblue).scaleEffect(1.5)})
                
//                new button that redirects to the view for adding a new item
                Button(action: {
                    showScanner.toggle()
                }) {
                    
                        Image(systemName: "plus.circle.fill").foregroundColor(CustomColor.darkblue).scaleEffect(1.5)
                    
                }
            })
            .sheet(isPresented: $showScanner) {
                ScanDocumentView(recognizedText: self.$recognizedText, showingNewItemView: $showData)

            }
            .sheet(isPresented: $showData) {
                NewItemView(text: self.recognizedText ,showData : $showData ,medicineViewModel: medicineViewModel, boxViewModel: boxViewModel, statsViewModel: statsViewModel, reconizeddata: RecognizedData())
            }
            
            
//
//            .sheet(isPresented: $showScanner) {
//                ScanDocumentView(recognizedText: self.$recognizedText, showingNewItemView: $showData)}
//                    .sheet(isPresented: $showData, content: {NewItemView(text: self.recognizedText ,showData : $showData ,medicineViewModel: medicineViewModel, boxViewModel: boxViewModel, statsViewModel: statsViewModel)})
        }
        
//       .sheet(isPresented: $showScanner) { // modified: add new medicine sheet
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
        
        .sheet(isPresented: $locationManagerK.showMap, content: {MapView()})
        .sheet(isPresented: $showData, content: {NewItemView( showData : $showData ,medicineViewModel: medicineViewModel, boxViewModel: boxViewModel, statsViewModel: statsViewModel)})

    }
}

//struct CabinetView_Previews: PreviewProvider {
//    static var previews: some View {
//        CabinetView()
//    }
//}
