//
//  MedData.swift
//  MedWaste
//
//  Created by Irene Fernando on 29/05/22.
//

import Foundation
import SwiftUI



struct MedData: Identifiable, Hashable, Codable {

    let id: UUID
    var name :String
    var dosage :String
    var type :String
    var price :String
    var units : String
    var category :String
    var isPinned :Bool = false
    
    init(id :UUID = UUID(), name :String, dosage :String, type :String, price :String, units : String , category :String, isPinned :Bool) {
        self.id = id
        self.name = name
        self.dosage = dosage
        self.type = type
        self.price = price
        self.units = units
        self.category = category
        self.isPinned = isPinned
    }
    
    
    

}

//extension MedData {
//
//    struct Data {
//        var name :String
//        var dosage :String
//        var type :String
//        var price :String
//        var units :Int
//        var category :String
//       }
//
//    var data: Data {
//        Data(name: name, dosage: dosage, type: type, price: price, units: units, category: category)
//    }
//
//    mutating func update(from data: Data) {
//        name = data.name
//        dosage = data.dosage
//        type = data.type
//        price = data.price
//        units = data.units
//        category = data.category
//    }
//
//    init(data: Data) {
//
//        id = UUID()
//        name = data.name
//        dosage = data.dosage
//        type = data.type
//        price = data.price
//        units = data.units
//        category = data.category
//
//    }
//
//}

//extension MedData {
//    
//    static let sampleData: [MedData] =
//    [
//        MedData(name: "Tachipirina", dosage: "100 mg", type: "compresse", price: "9,00 €",  units: 30, category: "antivirale", isPinned: false),
//        MedData(name: "Ayrinal", dosage: "100 mg", type: "compresse", price: "10,90 €",  units: 30, category: "antivirale", isPinned: false)
//
//    ]
//}
//

