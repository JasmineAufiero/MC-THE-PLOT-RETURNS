//
//  SingleMedView.swift
//  MedWaste
//
//  Created by Irene Fernando on 03/06/22.
//

import SwiftUI

struct SingleMedView: View {
    
    var medicine: MedData
    
    //    var nome: String
    //    var dosaggio: String
    //    var tipologia: String
    //    var prezzo :String
    //    var unità: Int
    //    var categoria :String
    //    var isPinned: Bool
    
    var medicineViewModel: MedicineViewModel
    var boxViewModel: BoxViewModel
    
    @State  var alertdonate = false
    @State  var alertexpire = false
    //    @State var isPinned : Bool = false
    @State var newBoxAdded :Int = 0 // it is a state variable that refreshes the view when a new box is added
    
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Image("pills").resizable().scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center).padding()
                    .rotation3DEffect(.degrees(80), axis: (x: 0, y: 0, z: 1))
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text(medicine.name).font(.title2).fontWeight(.bold).textCase(.uppercase)
                        Spacer()
                        Image(systemName: medicine.isPinned ? "heart.fill" : "heart").scaleEffect(1.5).foregroundColor(.pink)
                            .onTapGesture {
                                //
                                //                                if medicineViewModel.searchMedicineByName(medicine: nome)!.isPinned{
                                //                                    isPinned = false
                                //                                }
                                //                                else {
                                //                                    isPinned = true
                                //                                }
                                //                                isPinned = medicineViewModel.isPinnedMedicine(name: nome)
                                
                                medicineViewModel.pinMedicine(nome: medicine.name)
                                
                                //                                isPinned.toggle()
                            }
                        
                        //                                for i in 0..<medicineViewModel.medicines.count{
                        //                                    if medicineViewModel.medicines[i].isPinned{
                        //                                        medicineViewModel.medicines[i].isPinned = false
                        //                                    }else{
                        //                                        medicineViewModel.medicines[i].isPinned = true
                        //
                        //                                    }
                        //                                }
                        //
                        //                                if isPinned
                        //                                    medicineViewModel.addPinnedMedicines(name: nome, dosage: dosaggio, type: tipologia, price: prezzo, units: unità, category: categoria)
                        //                                }
                        //                                else {
                        //                                    medicineViewModel.removePinnedMedicines(name: nome)
                        //                                }
                        //                                pinnedMedicineNumber = medicineViewModel.pinnedMedicines.count-1
                        
                    }
                }
                
                Text(medicine.dosage).font(.title3)
                Text("AYRINAL compresse contiene il principio attivo bilastina che è un antistaminico. AYRINAL 20 mg compresse viene utilizzato per alleviare i sintomi di febbre da fieno (starnuti , prurito, naso che cola, naso chiuso ed arrossamento e lacrimazione oculare) ed altre forme di rinite allergica.").multilineTextAlignment(.leading)
                //                Divider()
                Spacer()
                HStack{
                    Text("Scatole").font(.title2).fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        boxViewModel.addNewBox(medicine: medicine.name, expirationDate: Date.now, state: .usable)
                        newBoxAdded = boxViewModel.boxes.count
                    })
                    { Image(systemName: "plus.circle.fill").scaleEffect(1.5).foregroundColor(CustomColor.darkblue)}
                }
                
                
            }
            .padding(20)
            //            .foregroundColor(CustomColor.graytext)
            
            
            List {
                ForEach(0..<(newBoxAdded == 0 ? boxViewModel.boxes.count : newBoxAdded), id: \.self) { index in
                    
                    //                        HStack{
                    //                            Text("Box \(index+1)")
                    //                                .fontWeight(.semibold)
                    //                            Spacer()
                    //
                    //
                    //                            Text("\(boxViewModel.boxes[index].expirationDate.formatToString(using: .MMddyy))")
                    //                                .foregroundColor(.secondary)
                    //                                .multilineTextAlignment(.leading)
                    //                        }
                    DatePickerView(selection: boxViewModel.boxes[index].expirationDate, index: index)
                        .listRowBackground(Color.init(red: 247/255, green: 213/255, blue: 223/255))
                        .swipeActions {
                            
                            Button{alertexpire.toggle()} label: {
                                Image(systemName: "trash.fill")
                            }
                            .tint(CustomColor.expiredred)
                            
                            
                            Button{alertdonate.toggle()} label: {
                                
                                //                            DonateIcon()
                                Image(systemName: "hand.raised.fill")
                                
                                
                            }
                            .tint(CustomColor.donnatedgreen)
                            
                        }
                }
            }
            .listStyle(.inset)
            .fixedSize(horizontal: false, vertical: false)
            .frame(height: UIScreen.screenHeight/2)
            .padding(20)
            
        }
        .padding(15)
        .onAppear(perform: {
            UITableView.appearance().backgroundColor = UIColor.clear
            UITableViewCell.appearance().backgroundColor = UIColor.clear
        })
        .sheet(isPresented: $alertdonate, content: {AlertView(statethrow: false, alertdonate: $alertdonate ,alertexpire: $alertexpire)})
        .sheet(isPresented: $alertexpire, content: {AlertView(statethrow: true, alertdonate: $alertdonate ,alertexpire: $alertexpire)})
        
        //        .sheet(isPresented: $alertdonate, content: {AlertView(statethrow: false)})
        //            .sheet(isPresented: $alertexpire, content: {AlertView(statethrow: true)})
        
    }
}



//struct SingleMedView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleMedView()
//    }
//}
