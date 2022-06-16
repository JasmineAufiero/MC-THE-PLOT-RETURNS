//
//  SingleMedView.swift
//  MedWaste
//
//  Created by Irene Fernando on 03/06/22.
//

import SwiftUI

struct SingleMedView: View {
    
    var medicine: MedData
    
    var medicineViewModel: MedicineViewModel
    var boxViewModel: BoxViewModel
    var testo : String = "This med belongs to the category: "
    var testo2 : String = "The price of a single box of meds is: "
    
    @State  var alertdonate = false
    @State  var alertexpire = false
    @State var newBoxAdded :Int = 0 // it is a state variable that refreshes the view when a new box is added
//    @State var expirationDate :[Date] = [Date.now]
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Image(medicineViewModel.chooseImage(type: medicine.type , medicine: medicine)).resizable().scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center).padding().scaleEffect(1.25)
                    .rotation3DEffect(.degrees(25), axis: (x: 0, y: 0, z: 1))
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text(medicine.name).font(.title2).fontWeight(.bold).textCase(.uppercase)
                        Spacer()
                        Image(systemName: medicine.isPinned ? "heart.fill" : "heart").scaleEffect(1.5).foregroundColor(.pink)
                            .onTapGesture {
                                medicineViewModel.pinMedicine(nome: medicine.name)
                            }
                        
                    }
                    Group{
                    Text(medicine.dosage)
//                    Text(medicine.category)
                    }
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 5)
                    
                    Group{
                    Text(LocalizedStringKey(String(testo)))
//                        .padding(.vertical, 5)
                    + Text(LocalizedStringKey(String(medicine.category)))
                        + Text(". \n")
                    + Text(LocalizedStringKey(String(testo2)))
                    + Text("\(medicine.price)" + "€.")
                    //                Divider()
                    }
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 5)
                }
                
            }
            .padding(20)
            //            .foregroundColor(CustomColor.graytext)
            
            HStack{
                Text(LocalizedStringKey(String("All the Boxes"))).font(.title2).fontWeight(.bold)
                Spacer()
                Button(action: {
                    boxViewModel.addNewBox(medicine: medicine.name, expirationDate: Date.now, state: .usable)
                    newBoxAdded = boxViewModel.filterBoxesForMedicine(medicine: medicine.name).count
                })
                { Image(systemName: "plus.circle.fill").scaleEffect(1.5).foregroundColor(CustomColor.darkblue)}
            }
            .padding(.horizontal,20)
            
            List {
                
                
                // if no boxes are added
                ForEach(0..<(newBoxAdded == 0 ? boxViewModel.filterBoxesForMedicine(medicine: medicine.name).count : newBoxAdded), id: \.self) { index in

                    DatePickerView(selection: boxViewModel.filterBoxesForMedicine(medicine: medicine.name)[index].expirationDate, index: index)
                        .listRowBackground(CustomColor.redform)
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
                        .foregroundColor(boxViewModel.boxes[index].state == .expired ? Color("rosso") : CustomColor.graytext)
//                        .onTapGesture {
//                            boxViewModel.newExpirationDate(box: &boxViewModel.filterBoxesForMedicine(medicine: medicine.name)[index], expirationDate: boxViewModel.filterBoxesForMedicine(medicine: medicine.name)[index].expirationDate)
//                       }
                
                    
                }.padding(20)
                    
            }
            .listStyle(.inset)
            .fixedSize(horizontal: false, vertical: false)
            .frame(height: UIScreen.screenHeight/2)
            .padding(20)
            
        }
//        .padding(15)
        .onAppear(perform: {
            UITableView.appearance().backgroundColor = UIColor.clear
            UITableViewCell.appearance().backgroundColor = UIColor.clear
        })
        .sheet(isPresented: $alertdonate, content: {AlertView(statethrow: false, alertdonate: $alertdonate ,alertexpire: $alertexpire, prezzo: medicine.price )})
        .sheet(isPresented: $alertexpire, content: {AlertView(statethrow: true, alertdonate: $alertdonate ,alertexpire: $alertexpire, prezzo: medicine.price)})
        
        //        .sheet(isPresented: $alertdonate, content: {AlertView(statethrow: false)})
        //            .sheet(isPresented: $alertexpire, content: {AlertView(statethrow: true)})
        
    }
}



//struct SingleMedView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleMedView()
//    }
//}
