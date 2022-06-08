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
    var body: some View {
        NavigationView{
//
//                card per le informzoni
            VStack{
                if showloader{
            CircleStatistic()
                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/2.5, alignment: .top)
                }
            ScrollView{
                VStack (spacing:0){
                    StatCardView(Status: "donated")
                    StatCardView(Status: "total")
                    StatCardView(Status: "expired")
                }

               
            } //scrool view
            .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight/2)
                
            
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
