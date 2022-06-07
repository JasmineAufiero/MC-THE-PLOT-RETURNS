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
    
    init(){
        Theme.navigationBarColors( titleColor: UIColor(CustomColor.darkblue))
        }

    var body: some View {
            TabView(){
                SummaryView()
                    .tabItem {Label("Riepilogo", systemImage: "square.grid.2x2.fill")}

                CabinetView(medicineViewModel: medicineViewModel, boxViewModel: boxViewModel)
                    .tabItem {Label("Armadietto", systemImage: "heart.text.square.fill")}

                StatisticsView()
                    .tabItem {Label("Statistiche", systemImage: "chart.pie.fill")}

            }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 Pro Max")
    }
}
