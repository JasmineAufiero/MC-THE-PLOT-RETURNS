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
        .offset(x: 5, y: 0)
        .frame(width: animation, height: 300, alignment: .leading)
        .animation(.easeIn(duration: 1), value: animation)

        .onAppear {
            self.animation = 400
        }


        
            VStack{
            HStack(spacing: 30){
            HStack (spacing: 20){
                RoundedRectangle(cornerRadius: 7, style: .continuous)
                    .fill(CustomColor.blueform)
                    .frame(width: 20, height: 20)
        Text(LocalizedStringKey(String("All meds")))
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.graytext)
            }
                HStack (spacing: 20){
                    RoundedRectangle(cornerRadius: 7, style: .continuous)
                        .fill(CustomColor.donnatedgreen)
                        .frame(width: 20, height: 20)
            Text(LocalizedStringKey(String("Donable")))
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
            Text(LocalizedStringKey(String("About to expire")))
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(CustomColor.graytext)
                }
                    HStack (spacing: 20){
                        RoundedRectangle(cornerRadius: 7, style: .continuous)
                            .fill(CustomColor.expiredred)
                            .frame(width: 20, height: 20)
                Text(LocalizedStringKey(String("Expired")))
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
