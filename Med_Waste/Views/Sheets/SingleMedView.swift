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
    var statsViewModel: StatsViewModel
    var testo : String = "Med category: "
    var testo2 : String = "The price of a single box of meds is: "
    var testo3 : String = "Contains: "
    
    var descriptionOfCategory = {
        
    }
    
    @State  var alertdonate = false
    @State  var alertexpire = false
    @State var newBoxAdded :Int = 0 // it is a state variable that refreshes the view when a new box is added
//    @State var expirationDate :[Date] = [Date.now]
    
//    private func deleteRow(at indexSet: IndexSet) {
//            self.newBoxAdded.remove(atOffsets: indexSet)
//        }
//
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Image(medicineViewModel.chooseImage(type: medicine.type , medicine: medicine)).resizable().scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center).padding().scaleEffect(1.2)
                    .rotation3DEffect(.degrees(25), axis: (x: 0, y: 0, z: 1))
                
                Spacer().frame(height: 50)
                
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text(medicine.name).font(.title2).fontWeight(.bold).textCase(.uppercase)
                        Spacer()
                        Image(systemName: medicine.isPinned ? "heart.fill" : "heart").scaleEffect(1.5).foregroundColor(.pink)
                            .onTapGesture {
                                medicineViewModel.pinMedicine(nome: medicine.name)
                            }
                        
                    }
                  
                    Text(medicine.dosage)
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
                    + Text("\(medicine.price)" + "€")
                        + Text(". \n")
                    + Text(LocalizedStringKey(String(testo3)))
                      
                    + Text("\(medicine.units)")
                        + Text(". \n \n")
                    //                Divider()
                        + Text(DescriptionOfCategory(category: medicine.category))
                            .font(.system(size: 16))
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
                
                ForEach(0..<(newBoxAdded == 0 ? boxViewModel.filterBoxesForMedicine(medicine: medicine.name).count : newBoxAdded) , id: \.self){ index in
                // if no boxes are added

                    DatePickerView(selection: boxViewModel.filterBoxesForMedicine(medicine: medicine.name)[index].expirationDate, index: index)
                        .listRowBackground(CustomColor.redform)
                        .swipeActions {

                            Button{
                                boxViewModel.deleteBox(indexx: index)
                                alertexpire.toggle()
                                
                            } label: {
                                Image(systemName: "trash.fill")
                            }
                            .tint(CustomColor.expiredred)


                            Button{
                                boxViewModel.deleteBox(indexx: index)
                                alertdonate.toggle()} label: {

                                //                            DonateIcon()
                                Image(systemName: "hand.raised.fill")


                            }
                            .tint(CustomColor.donnatedgreen)

                        }
                        .foregroundColor(boxViewModel.boxes[index].state == .expired ? Color("rosso") : CustomColor.graytext)
//                        .onTapGesture {
//                            boxViewModel.newExpirationDate(box: &boxViewModel.filterBoxesForMedicine(medicine: medicine.name)[index], expirationDate: boxViewModel.filterBoxesForMedicine(medicine: medicine.name)[index].expirationDate)
//                       }
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
        .sheet(isPresented: $alertdonate, content: {AlertView(statsViewModel: statsViewModel, statethrow: false, alertdonate: $alertdonate ,alertexpire: $alertexpire, prezzo: medicine.price )})
        .sheet(isPresented: $alertexpire, content: {AlertView(statsViewModel: statsViewModel, statethrow: true, alertdonate: $alertdonate ,alertexpire: $alertexpire, prezzo: medicine.price)})
        
        //        .sheet(isPresented: $alertdonate, content: {AlertView(statethrow: false)})
        //            .sheet(isPresented: $alertexpire, content: {AlertView(statethrow: true)})
        
    }
    
    func DescriptionOfCategory(category: String) -> String{
        switch category {
        case "Antihistamines":
            return "Antihistamines are used to relieve the ailments (symptoms) caused by allergies, such as seasonal allergic rhinitis (“hay fever”), hives, conjunctivitis and reactions to insect bites."
    
        case "Antibiotics":
            return "Antibiotics are medicines used to treat or prevent infections caused by bacteria. They are able to kill the bacteria themselves and / or prevent their multiplication and spread within the body and transmission to other people."
        case "Painkillers":
            return "Pain relievers are drugs that relieve pain. Like any other drug, they have potential side effects, but if used correctly, respecting the doses and methods of administration, they can help improve the quality of life."
        case "Anti-inflammatory":
            return "Anti-inflammatories are drugs used to counteract pain, inflammation and sometimes even fever. The group of NSAIDs includes numerous active ingredients, widely used in therapy for the treatment of many ailments and diseases."
        case "Antivirals":
            return "Antiviral drugs are a category of chemotherapy drugs that are active against infections caused by viruses. In particular, their action manifests itself in various stages of viral replication."
        case "Dermatological":
            return "Usually topical medications are administered locally. They exploit the properties of the substance or its vehicle and its excipients, so that the pharmacological action takes place directly on the skin or mucosa where it is applied."
            
        case "Gastrointestinal":
            return "The gastrointestinal tract drugs have the function of healing and treating the organs of the digestive system. Many of these drugs must be taken on prescription, paying close attention to the instructions on the package regarding the dosage and how to take them."
        case "Supplements":
           return  "Food supplements are used to supplement the normal diet in cases where there is a deficit of nutrients, for reduced intake, or for increased needs."
        default:
            return ""
            
            
        }
    }
}



//struct SingleMedView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleMedView()
//    }
//}
