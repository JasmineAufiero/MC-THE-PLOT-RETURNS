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
    
    @State var nome: String = ""
    @State var dosaggio: String = ""
    @State var tipologia: String = ""
    @State var prezzo: String = ""
    @State var unità: String = ""
    @State private var numerobox = 1
    @State var isTheSameDate = false
    @State var categoria = ""
    @State var expirationDate :[Date] = [Date.now] // an array of expiration date for different boxes
    
    @Binding var showData: Bool
    
    
    var medicineViewModel :MedicineViewModel
    var boxViewModel :BoxViewModel
    
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Conferma Informazioni")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal,20)
                
                Form {
                    
                    Section {
                        HStack {
                            Text("Nome")
                                .fontWeight(.semibold)
                            Spacer()
                            TextField("Nome", text: $nome)
                                .multilineTextAlignment(.trailing)
                                .focused($amountIsFocused)
                            
                        }
                        HStack {
                            Text("Dosaggio")
                                .fontWeight(.semibold)
                            Spacer()
                            TextField("Dosaggio", text: $dosaggio)
                                .multilineTextAlignment(.trailing)
                                .focused($amountIsFocused)
                        }
                        HStack {
                            Text("Tipogia")
                                .fontWeight(.semibold)
                            Spacer()
                            TextField("Tipologia", text: $tipologia)
                                .multilineTextAlignment(.trailing)
                                .focused($amountIsFocused)
                            //
                        }
                        HStack {
                            Text("Prezzo")
                                .fontWeight(.semibold)
                            Spacer()
                            TextField("Prezzo", text: $prezzo)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                                .focused($amountIsFocused)
                        }
                        HStack {
                            Text("Unità")
                                .fontWeight(.semibold)
                            Spacer()
                            TextField("Unità", text: $unità)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                                .focused($amountIsFocused)
                            
                        }
                        
                    } // :Information section
                    .padding()
                    .listRowBackground(CustomColor.blueform)
                    
                    // adding the number of boxes
                    
                    Group {
                        Section {
                            HStack {
                                Text("Numero di scatole:  \(numerobox)")
                                    .fontWeight(.semibold)
                                
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
                    
                    
                    Text("Date di Scadenza")
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
                    
                    
//                    Text("Categoria")
//                        .font(.title2)
//                        .fontWeight(.semibold)
//                        .multilineTextAlignment(.leading)
//
//
//                    VStack(spacing: 20) {
//                        Picker(selection: $categoria, label: Text("Categoria Medicinale")) {
//                            Text("Antistaminici").tag(1)
//                            Text("Antivirali").tag(2)
//                            Text("Anti-Infiammatori").tag(3)
//                            Text("Antibiotici").tag(4)
//                            Text("Antimicotici").tag(5)
//                            Text("Analgesici").tag(6)
//                        }
//                    }
                    
//                    Spacer()
                    
                    
                    // "Done Button" it allows to add an element inside the cabinet view
               
                        
                        Button(action: {
                            medicineViewModel.addNewMedicine(name: nome, dosage: dosaggio, type: tipologia, price: prezzo, units: Int(unità) ?? 0, category: "antistaminico")
                            
                            
                            
                            // add all the boxes of that medicine
                            for i in 1...numerobox {
                                boxViewModel.addNewBox(medicine: nome, expirationDate: expirationDate[i-1], state: .usable)
                            }
                            
                            showData = false
                        }, label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 300, height: 50, alignment: .center)
                            
                                .overlay(Text("Conferma").foregroundColor(.white))
                        }).disabled(nome.isEmpty || dosaggio.isEmpty || tipologia.isEmpty || tipologia.isEmpty || prezzo.isEmpty || unità.isEmpty ).padding()
                        
                        
                        
                        
                        
//                    Button("Conferma") {
//                        
//                        medicineViewModel.addNewMedicine(name: nome, dosage: dosaggio, type: tipologia, price: prezzo, units: Int(unità) ?? 0, category: "antistaminico")
//                        
//                        
//                        
//                        // add all the boxes of that medicine
//                        for i in 1...numerobox {
//                            boxViewModel.addNewBox(medicine: nome, expirationDate: expirationDate[i-1], state: .usable)
//                        }
//                        
//                        showData = false
//                        
//                    }.disabled(self.nome.isEmpty)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.accentColor)
//                    .cornerRadius(8)
                    
//                        Spacer()
                    
                    
                    
                    
                } // :form
                .onAppear(perform: {
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                })
                .focused($amountIsFocused)
                
            }
            
            .navigationTitle("Nuovo medicinale")
            .onTapGesture {amountIsFocused = false}
        }
    }
}


//struct NewItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewItemView()
//            .previewDevice("iPhone 13 Pro Max")
//    }
//}
