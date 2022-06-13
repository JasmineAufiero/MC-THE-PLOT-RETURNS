//
//  CircleStatistic.swift
//  MedWaste
//
//  Created by Rosa Cimmino on 07/06/22.
//

import SwiftUI

struct CircleStatistic: View {
     var statsviewmodel = StatsViewModel()
    @State var animation : CGFloat = 300
    var body: some View {
       
        VStack{
            ZStack(alignment: .center) {
                ForEach(statsviewmodel.stats){ stat in
//                    if !statsviewmodel.stats.isEmpty {
                        CircleAnimationCard(percent: statsviewmodel.convertToPercentage(currentvalue: statsviewmodel.stats[stat.index].value), scale: statsviewmodel.convertToScale(currentvalue: statsviewmodel.stats[stat.index].value), color: stat.color)
                        
                        
//                    }else{
//                        CircleAnimationCard(percent: 20, scale: 0.4, color: "DonatedGreen")
//                    }
                    
                    
                    
                    
                }


                
        }
        .padding()
        .offset(x: 17, y: 0)
        .frame(width: animation, height: 300, alignment: .center)
        .animation(.easeIn(duration: 1), value: animation)

        .onAppear {
            self.animation = 400
        }


        
            VStack{
            HStack(spacing: 30){
            HStack (spacing: 20){
                RoundedRectangle(cornerRadius: 7, style: .continuous)
                    .fill(CustomColor.darkblue)
                    .frame(width: 20, height: 20)
        Text("Tutti i farmaci")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.graytext)
            }
                HStack (spacing: 20){
                    RoundedRectangle(cornerRadius: 7, style: .continuous)
                        .fill(CustomColor.donnatedgreen)
                        .frame(width: 20, height: 20)
            Text("Donabili")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(CustomColor.graytext)
            }
            }
       
                HStack(spacing: 30){
                HStack (spacing: 20){
                    RoundedRectangle(cornerRadius: 7, style: .continuous)
                        .fill(.orange)
                        .frame(width: 20, height: 20)
            Text("In Scadenza   ")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(CustomColor.graytext)
                }
                    HStack (spacing: 20){
                        RoundedRectangle(cornerRadius: 7, style: .continuous)
                            .fill(CustomColor.expiredred)
                            .frame(width: 20, height: 20)
                Text("Scaduti ")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(CustomColor.graytext)
                }
                }
            
            }
    }
    }
}

//struct CircleStatistic_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleStatistic()
//    }
//}
