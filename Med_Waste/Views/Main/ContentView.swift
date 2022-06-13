//
//  ContentView.swift
//  MedWaste
//
//  Created by Francesco on 23/05/22.
//
// The Main View

import SwiftUI

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}


struct ContentView: View {
    
    @StateObject var medicineViewModel = MedicineViewModel()
    @StateObject var boxViewModel = BoxViewModel()
   
    @State var DefaultTab = 2  //necessary to make the cabinet view the default one
    init(){
        Theme.navigationBarColors( titleColor: UIColor(CustomColor.darkblue))
        }

    var body: some View {
            TabView(selection: $DefaultTab){
                
                SummaryView(medicineViewModel: medicineViewModel, boxViewModel: boxViewModel)
                    .tabItem {Label("Riepilogo", systemImage: "square.grid.2x2.fill")}
                    .tag(1)
  

                CabinetView(pinnedMedicineNumber: 10, medicineViewModel: medicineViewModel, boxViewModel: boxViewModel)
                    .tabItem {Label("Armadietto", systemImage: "heart.text.square.fill")}
                    .tag(2)

                StatisticsView()
                    .tabItem {Label("Statistiche", systemImage: "chart.pie.fill")}
                    .tag(3)

            }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
//            .previewDevice("iPhone 13 Pro Max")
//    }
//}
