//
//  StatsViewModel.swift
//  Med_Waste
//
//  Created by Irene Fernando on 08/06/22.
//

import Foundation

class StatsViewModel : ObservableObject {
    @Published var stats :[StatsData] = 
    
    
    [
        StatsData(index : 0,name: "Total", color: "BlueForm", value: 0.0),
        StatsData(index : 1,name: "Donabili", color: "DonatedGreen", value: 0.0),
        StatsData(index : 2,name: "InScadenza", color: "RedForm", value: 0.0),
        StatsData(index : 3,name: "Scaduti", color: "ExpiredRed", value: 0.0)
    ]
    {
    willSet{
        objectWillChange.send()
    }}

    init() {
        if let data = UserDefaults.standard.data(forKey: "SavedStats") {
            if let decoded = try? JSONDecoder().decode([StatsData].self, from: data) {
                stats = decoded
                return
            }
        }

        stats = []
    }
    
    func addStatData(index : Int, name : String ,color : String , value : Double) {
        stats.append(StatsData(index: index, name: name, color: color, value: value))
        saveStats()
    }
    
    func saveStats() {
        if let encoded = try? JSONEncoder().encode(stats) {
            UserDefaults.standard.set(encoded, forKey: "SavedStats")
        }
    }
    
    func convertToPercentage( currentvalue : Double) -> Int  {
        let percent = convertToScale(currentvalue: currentvalue) * 100
                return Int(percent)
    }

    
    func convertToScale(currentvalue : Double) -> Double  {
        let scalefact = (currentvalue / (stats[0].value == 0.0 ? 1.0 :stats[0].value) )
            return scalefact
        }
    
    func changeValue(price : String, type : Int , noOfBoxes : Double) {
        stats[type].value += Double(price)! * noOfBoxes
        stats[type].value.round(.towardZero)
//        if stats[type].value.digitCount >= 5 {
//            stats[type].value = stats[type].value / 1000
//        }
//        stats[type].value.round(.towardZero)
        saveStats()
    }
    
    func statValue(currentvalue : Double) -> String  {
        var statValue : Double = 0.0
        if currentvalue.digitCount >= 5 {
            statValue = currentvalue / 1000
            statValue.round(.towardZero)
            objectWillChange.send()
            return String(statValue) + "K"
        }else {
            statValue = currentvalue
            objectWillChange.send()
            return String(statValue)
        }
      
   }
 
    
}
