//
//  StatisticsView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is the StatisticsView the 3rd component of the Tab bar


import SwiftUI

struct StatisticsView: View {
//    @Binding var status : String
    @State var showloader = false
    
    @ObservedObject var statsviewmodel = StatsViewModel()
    
    @State var animation : CGFloat = 300
    var body: some View {
        NavigationView{
            ScrollView{
//
//                card per le informzoni
            VStack{
                if showloader{
                    
                    ZStack(alignment: .center) {
                        
                        
                        ForEach(statsviewmodel.stats){ stat in
                            
                            CircleAnimationCard(percent: statsviewmodel.convertToPercentage(currvalue: statsviewmodel.stats[stat.index].value), scale: statsviewmodel.convertToScale(currvalue: statsviewmodel.stats[stat.index].value), color: stat.color)
                            
                            
                        }
                        
                    }
                    .padding()
                    .offset(x: 17, y: 0)
                    .frame(width: animation, height: 300, alignment: .center)
                    .animation(.easeIn(duration: 1), value: animation)
                    
                    .onAppear {
                        self.animation = 400
                    }
                    
                    
                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/2.5, alignment: .center)
                }
           
//                VStack (spacing:0){
                StatCardView(Status: "total" , stat : StatsViewModel().stats[0].value)
                StatCardView(Status: "donated", stat : StatsViewModel().stats[1].value)
                StatCardView(Status: "expired", stat : StatsViewModel().stats[2].value)
//                }

               
            } //scrool view
//            .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight/2)
                
            
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01 ) {
                    
                    showloader = true
                   
                }
            }
                .navigationTitle("Statistiche")
                }
 
    }
}

//
//struct StatisticsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatisticsView()
//    }
//}
