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

}


