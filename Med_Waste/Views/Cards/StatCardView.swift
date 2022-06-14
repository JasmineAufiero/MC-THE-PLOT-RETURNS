//
//  StatCardView.swift
//  MedWaste
//
//  Created by Rosa Cimmino on 07/06/22.
//

import SwiftUI



struct StatCardView: View {
    @State var Status: String
    @State var stat : String
//    the string can have values donated, expired or total and indicated the respective category of money
    
//    switch case per cambiare i dettagli a lato e cambiare il colore in base alle informazioni lette
    
//    total amount of money spent, amount of money spent for donated medicines, amount of money spend for expired medicines
    var body: some View {
        
        ZStack{
        RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(CustomColor.medcardgray)
            .fixedSize(horizontal: false, vertical: false)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            
            HStack (spacing: 20){
                
            if (Status == "donated"){
                    Text("\(stat)" + "€")
                    .foregroundColor(CustomColor.donnatedgreen)
                        .font(Font.system(size: 28, weight: .bold))
                        .scaledToFit()
                            .minimumScaleFactor(0.01)
                            .lineLimit(1)
                
                Text("Somma di denaro donato in medicinali fino ad ora.")
                    .foregroundColor(CustomColor.graytext)
                    .multilineTextAlignment(.leading)
//                    .padding()
                    .frame(maxWidth: 200, maxHeight: 200, alignment: .trailing)
               
            }
                    
                    
                    
            if (Status == "expired"){
                    Text("\(stat)" + "€")
                        .font(Font.system(size: 28, weight: .bold))
                        .foregroundColor(CustomColor.expiredred)
                        .scaledToFit()
                            .minimumScaleFactor(0.01)
                            .lineLimit(1)
                       
                
                Text("Somma dedotta in base ai medicinali scaduti presenti nell'app.")
                    .foregroundColor(CustomColor.graytext)
                    .multilineTextAlignment(.leading)
//                    .padding()
                    .frame(maxWidth: 200, maxHeight: 200, alignment: .trailing)
               
             }
                    
                    
                if (Status == "total"){
                    
                    Text("\(stat)" + "€")
                        .font(Font.system(size: 28, weight: .bold))
                        .foregroundColor(CustomColor.darkblue)
                        .scaledToFit()
                            .minimumScaleFactor(0.01)
                            .lineLimit(1)
                    
                    Text("Totale spesa medicinali. La media italiana per cittadino è 438 €.")
                        .foregroundColor(CustomColor.graytext)
                        .multilineTextAlignment(.leading)
//                        .padding()
                        .frame(maxWidth: 200, maxHeight: 200, alignment: .center)
                   
                }
                
                               
                
            }
        }
        .padding()
        .padding(.horizontal , 5)
        .frame(width: UIScreen.screenWidth, height: 150, alignment: .center)
 
    }
}

//struct StatCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatCardView()
//    }
//}
