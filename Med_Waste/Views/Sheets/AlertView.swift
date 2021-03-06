//
//  AlertView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is used for both alert of donate/throw away meds by using a parameter D or Ex

import SwiftUI

struct AlertView: View {
    @State private var isHalf = false
    @State private var isFull = false
    @State private var isEmpty = false
    @State var donateQ = "How much of your box were you able to donate?"
    @State var expireQ = "How much of your box did you manage to use?"
    var statsViewModel : StatsViewModel
    var statethrow : Bool
   
    @Binding var alertdonate: Bool
    @Binding var alertexpire: Bool
    var prezzo : String
    @State var amount = 0.0
    
//    var box : [MedBox]
    
    var body: some View {
        VStack {
            
            
//            Image(systemName: "x.circle.fill").scaleEffect(2) .frame(width: UIScreen.screenWidth, height: 50, alignment: .trailing).padding(.trailing, 50)
            
            
            Image(statethrow ? "throwimg" : "donateimg").resizable().frame(width: 350, height: 300, alignment: .center)
            
            Spacer().frame(height: 50)
            
            VStack(alignment:.leading){
                
                if statethrow {
                    Text(LocalizedStringKey(String(expireQ)))
                        .font(.title3)
                        .fontWeight(.semibold)
                } else {
                Text(LocalizedStringKey(String(donateQ)))
                    .font(.title3)
                    .fontWeight(.semibold)
                }
                
                CircleCheckBox(isSelected: isEmpty, state: "Less than half").onTapGesture {
                    isEmpty.toggle()
                    if isEmpty{
                        isHalf = false
                        isFull = false
                        amount = 0.35
                    }
                    
                }
                CircleCheckBox(isSelected: isHalf, state: "Almost half").onTapGesture {
                    isHalf.toggle()
                    if isHalf{
                        isEmpty = false
                        isFull = false
                        amount = 0.5
                    }
                }
                CircleCheckBox(isSelected: isFull, state: "Almost all the box").onTapGesture {
                    isFull.toggle()
                    if isFull{
                        isHalf = false
                        isEmpty = false
                        amount = 0.8
                    }
                }
            }//close the vstack
            .padding()
            Spacer()
            Button(action: {
                alertdonate ? statsViewModel.changeValue(price: prezzo, type: 1,noOfBoxes: amount) : statsViewModel.changeValue(price: prezzo, type: 2,noOfBoxes: amount)
//                BoxViewModel().changeState()
//                medicineViewModel.pinMedicine(nome: medicine.name)
                
//                statethrow ? box.
                statethrow ? alertexpire.toggle() : alertdonate.toggle()
            }, label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 50, alignment: .center)
                
                    .overlay(Text(LocalizedStringKey(String("Done"))).foregroundColor(.white))
            }).disabled(!(isFull || isHalf || isEmpty))
            
            
        }.padding()
    }
}


//struct AlertView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlertView( statethrow: false)
//    }
//}
