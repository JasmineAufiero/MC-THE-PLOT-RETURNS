//
//  NewItemView.swift
//  MedWaste
//
//  Created by Jasmine Aufiero on 23/05/22.
//
// This view is used for adding a new item to the cabinet.

import SwiftUI

struct NewItemView: View {
    @FocusState private var amountIsFocused: Bool
    var text : String
    @State var nome: String = ""
    @State var dosaggio: String = ""
    @State var tipologia = "Pillole"
    @State var prezzo: String = ""
    @State var unità: String = ""
    @State private var numerobox = 1
    @State var isTheSameDate = false
    @State var categoria = ""
    @State var expirationDate :[Date] = [Date.now] // an array of expiration date for different boxes
    
//        .focused($amountIsFocused)
    @State var chosenCategory :String = ""
    
    @State var expand = false // for the tipology picker
    @Binding var showData: Bool
    var tipologia_picker = ["Pillole", "Bustine", "Sciroppo", "Pomata", "Fiala"]
    var medicineViewModel :MedicineViewModel
    @ObservedObject var boxViewModel :BoxViewModel
    var statsViewModel : StatsViewModel
    var reconizeddata : RecognizedData
    
    var MedCategoriesPicker = ["Antibiotici", "Antidolorifici", "Anti-Infiammatori", "Antivirali", "Antistaminici", "Dermatologici", "Gastrointestinali", "Integratori", "Altro"]
    var categoria_picker = ["Antibiotici", "Antidolorifici", "Anti-Infiammatori", "Antivirali", "Antistaminici", "Dermatologici", "Gastrointestinali", "Integratori", "Altro"]
    @State var numberofMedCategories = 0  //necessary for the picker choice
    
        func getdata() {
            nome = reconizeddata.getName(text: text)
            dosaggio = reconizeddata.getDosage(text: text)
            tipologia = reconizeddata.getTypeName(type: reconizeddata.getType(text: text))
            prezzo = reconizeddata.getPrice(text: text)
            unità = reconizeddata.getUnits(text: text)
            expirationDate[0] = [reconizeddata.getDate(text: text)!].isEmpty ? Date.now : reconizeddata.getDate(text: text)!
        }
   

    
    
    
    
    var body: some View {
            
            NavigationView {
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text(LocalizedStringKey(String("Conferma Informazioni")))
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal,20)
                  
                    
                    Form {
                        
                        Section {
                            HStack {
                                Text(LocalizedStringKey(String("Nome")))
                                    .fontWeight(.semibold)
                                Text("*")
                                    .fontWeight(.semibold).foregroundColor(.red)
                                Spacer()
                                TextField(LocalizedStringKey(String("Nome")), text: $nome)
                                    .multilineTextAlignment(.trailing)
//                                    .focused($amountIsFocused)
                                
                            }
                            HStack {
                                Text(LocalizedStringKey(String("Dosaggio")))
                                    .fontWeight(.semibold)
                                Spacer()
                                TextField(LocalizedStringKey(String("Dosaggio")), text: $dosaggio)
                                    .multilineTextAlignment(.trailing)
//                                    .focused($amountIsFocused)
                            }
                            HStack {
                                Text(LocalizedStringKey(String("Tipologia")))
                                    .fontWeight(.semibold)
                                Text("*")
                                    .fontWeight(.semibold).foregroundColor(.red)
                                Spacer()
                               
                                
                                Button(action: {
                                    self.expand.toggle()
                                }, label: {
                                        
                                        if expand {
                                            Picker(LocalizedStringKey(String("Tipologia")), selection: $tipologia) {
                                                ForEach(tipologia_picker, id: \.self) {
                                                    Text(LocalizedStringKey(String("\($0)")))
                                                }
                                            }.pickerStyle(.wheel)
                                            
                                        }
                                        else {
                                            Text(LocalizedStringKey(String("\(tipologia)")))
                                                .multilineTextAlignment(.trailing)
                                                .foregroundColor(.gray)
                                        }
                                })
                    
                            }
                            .onTapGesture {
                                expand.toggle()
                            }
                            HStack {
                                Text(LocalizedStringKey(String("Prezzo")))
                                    .fontWeight(.semibold)
                                Text("*")
                                    .fontWeight(.semibold).foregroundColor(.red)
                                Spacer()
                                TextField(LocalizedStringKey(String("Prezzo")), text: $prezzo)
                                    .multilineTextAlignment(.trailing)
                                    .keyboardType(.decimalPad)
//                                    .focused($amountIsFocused)
                            }
                            HStack {
                                Text(LocalizedStringKey(String("Unità")))
                                    .fontWeight(.semibold)
                                Spacer()
                                TextField(LocalizedStringKey(String("Unità")), text: $unità)
                                    .multilineTextAlignment(.trailing)
                                    .keyboardType(.numberPad)
//                                    .focused($amountIsFocused)
                            }
                            
                        } // :Information section
                        .padding()
                        .listRowBackground(CustomColor.blueform)
//                        .onTapGesture {amountIsFocused = false}
                        
                        // adding the number of boxes
                        
                        Group {
                            Section {
                                HStack {
                                    Group{
                                    Text(LocalizedStringKey(String("Numero di scatole: ")))
                                            .fontWeight(.semibold)
                                        + Text("\(numerobox)")
                                            .fontWeight(.semibold)
                                    }

                                        
                                    
                                    StepperView(expirationDates: $expirationDate, numerobox: $numerobox)
                                    
    //                                Stepper("", onIncrement: {
    //                                    if numerobox < 50 { numerobox += 1
    //                                    }
    //                                    expirationDate.insert(Date.now, at: numerobox-1)
    //
    //                                }, onDecrement: {
    //                                    if numerobox > 1 { numerobox -= 1
    //                                        expirationDate.remove(at: numerobox-1) }
    //
    //                                })
                                            
    //                                Stepper("", value: $numberobox, in: 1...50)
    //                                    .multilineTextAlignment(.trailing)
                                }
                                
                            }.listRowBackground(CustomColor.blueform).padding()
                            // : section for stepper
                            
                        }
                        
                        
                        Text(LocalizedStringKey(String("Date di Scadenza")))
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        
                        
                        CheckBoxView(isTheSameDate: $isTheSameDate)
                            .onTapGesture {
                                isTheSameDate.toggle()
                            }
                        
                        
                        // modified: check if the used ask to add more than one box with the same expiration date
                        Section {
                            ForEach(1...numerobox, id: \.self) { index in
                                
                                HStack {
                                    DatePicker("Box  \(index)", selection:
                                                  
                                                // if the user wants all the boxes have the same expiration date,it automatically update the same date, else each box has a different expiration date
                                               isTheSameDate ? $expirationDate[0] : $expirationDate[index-1]
                                                
                                                
                                                , in: Date()..., displayedComponents: .date)
                                    
                                    Spacer()
                                    
                                    Button {} label: {
                                        Image(systemName: "viewfinder") // add the possibility to scan
                                    }
                                }
                                
                            }
                        }
                        .listRowBackground(CustomColor.redform).padding()
                        // : section for stepper
                        HStack{
                        
                        Text(LocalizedStringKey(String("Categoria")))
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text("*")
                            .fontWeight(.semibold).foregroundColor(.red)
                        }

                        VStack(spacing: 20) {
//                            Picker(selection: $categoria, label: Text("Categoria Medicinale \($categoria)")) {
////                                ForEach(0 ..< MedCategoriesPicker.count) {
////                                                Text(self.MedCategoriesPicker[$0]).tag($0)
//                                Text("Antibiotici").tag(1)
//                                Text("Antidolorifici").tag(2)
//                                Text("Anti-Infiammatori").tag(3)
//                                Text("Antivirali").tag(4)
//                                Text("Antistaminici").tag(5)
//                                Text("Dermatologici").tag(6)
//                                Text("Gastointestinali").tag(7)
//                                Text("Integratori").tag(8)
//                                Text("Altro").tag(9)
////                                }
//                            }
                            
                            
                            Section {
                                Picker(LocalizedStringKey(String("Scegli")), selection: $chosenCategory) {
                                    ForEach(categoria_picker, id: \.self) {
                                        Text(LocalizedStringKey(String("\($0)")))
//                                                        .onTapGesture{
//                                                            chosenCategory = categoria[numberofMedCategories]
//                                                        }
                                                }
                                            }
                                        }
                        
                        
                        }
                       
                    
                        VStack{  //necessary to have the space between the category picker and the done button
                        
                        // "Done Button" it allows to add an element inside the cabinet view
                        HStack {
                        
                            Spacer()
                        Button(LocalizedStringKey(String("Conferma"))) {
                            
                            medicineViewModel.addNewMedicine(name: nome, dosage: dosaggio, type: tipologia, price: prezzo, units: unità, category: chosenCategory, isPinned: false)
                            statsViewModel.changeValue(price: prezzo, type: 0 ,noOfBoxes: Double(numerobox))
                            
                           
                            // add all the boxes of that medicine
                            for i in 1...numerobox {
                                boxViewModel.addNewBox(medicine: nome, expirationDate: expirationDate[i-1], state: .usable)
                                boxViewModel.newExpirationDate(box: &boxViewModel.boxes[i-1], expirationDate: boxViewModel.boxes[i-1].expirationDate)
                            }
                            showData = false
                            
                        }.frame(width: 200, height: 30, alignment: .center)
                                
                        .disabled(nome.isEmpty || tipologia.isEmpty || prezzo.isEmpty )
                        .foregroundColor(.white)
                        .padding()
                        .background(nome.isEmpty || tipologia.isEmpty || prezzo.isEmpty  ? Color.gray : Color.accentColor)
                        .cornerRadius(8)
                        
                            Spacer()
                        }
                        
                        }.padding()
                        
                    } // :form
                    .onAppear(perform: {
                        UITableView.appearance().backgroundColor = UIColor.clear
                        UITableViewCell.appearance().backgroundColor = UIColor.clear
                        getdata()
                    })
                    
                }
                
                .navigationTitle(LocalizedStringKey(String("Nuovo medicinale")))
                
            }
        }
    }


//struct NewItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewItemView()
//            .previewDevice("iPhone 13 Pro Max")
//    }
//}
