//
//  StatsViewModel.swift
//  Med_Waste
//
//  Created by Irene Fernando on 08/06/22.
//

import Foundation

class StatsViewModel : ObservableObject {
    @Published var stats :[StatsData] = [
        StatsData(index : 0,name: "Total", color: "BlueForm", value: 26.4),
        StatsData(index : 1,name: "Donabili", color: "DonatedGreen", value: 17),
        StatsData(index : 2,name: "InScadenza", color: "RedForm", value: 10),
        StatsData(index : 3,name: "Scaduti", color: "ExpiredRed", value: 5)
    ]
    
    func convertToPercentage( currvalue : Double) -> Double  {
        let percent = (currvalue / stats[0].value) * 100
                return round(percent)
    }

    
    func convertToScale(currvalue : Double) -> Double  {
        let scalefact = (currvalue / stats[0].value)
            return scalefact
        }
    
    func changeValue(price : String, type : Int) {
        stats[type].value += Double(price)!
    }
 
    
}
