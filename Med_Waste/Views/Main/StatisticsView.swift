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
    @ObservedObject var statsviewmodel : StatsViewModel
    @State var showloader = false
   
//    @ObservedObject var statsviewmodel = StatsViewModel()
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
           
           StatCardsCollection(statsviewmodel: statsviewmodel)
            } //scrool view

                
            
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
