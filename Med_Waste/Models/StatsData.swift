//
//  StatsData.swift
//  Med_Waste
//
//  Created by Irene Fernando on 08/06/22.
//

import Foundation
import SwiftUI


struct StatsData : Codable , Identifiable {
    var id = UUID()
    var index: Int
    var name: String
    var color: String
    var value: Double
   
//    init(id:UUID = UUID(), name: String, color: String, value:Double) {
//        self.id = id
//        self.name = name
//        self.color = color
//        self.value = value
//    }
    
    
//    var total : Double
//    var expired : Double
//    var donated : Double
}


//extension StatsData : Decodable {
//
//    init(from decoder: Decoder) throws {
//        // id
//        
//        let container = try decoder.container(keyedBy: RootKeys.self)
//        color = try container.decode(Int.self, forKey: .color)
//
//        /* ... */
//    }
//
//}
