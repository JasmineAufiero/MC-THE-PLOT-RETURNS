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
//    @Published var ok = StatsViewModel().stats[0].value {
//        willSet{
//            objectWillChange()
//        }
//    }
    
    var body: some View {
        NavigationView{
            ScrollView{
//
//                card per le informzoni
            VStack{
                if showloader{
            CircleStatistic()
                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/2.5, alignment: .center)
                }
           
//                VStack (spacing:0){
             
//                }
//StatsDetailView()
                
                StatCardView(Status: "total" , stat : String(statsviewmodel.stats[0].value) )
                StatCardView(Status: "donated", stat : String(statsviewmodel.stats[1].value) )
                StatCardView(Status: "expired", stat : String(statsviewmodel.stats[2].value) )
//                StatCardView(Status: "total" , stat : statsviewmodel.statValue(currentvalue: statsviewmodel.stats[0].value))
//                StatCardView(Status: "donated", stat : statsviewmodel.statValue(currentvalue: statsviewmodel.stats[1].value) )
//                StatCardView(Status: "expired", stat : statsviewmodel.statValue(currentvalue: statsviewmodel.stats[2].value) )
               
            } //scrool view
//            .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight/2)
                
            
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01 ) {
                    
                    showloader = true
                   
                }
            }
                .navigationTitle(LocalizedStringKey(String("Statistics")))
                }
 
    }
}

//
//struct StatisticsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatisticsView()
//    }
//}
