//
//  Box.swift
//  MedWaste
//
//  Created by Jasmine Aufiero on 31/05/22.
//

import Foundation

struct MedBox :Identifiable, Codable {
    
    let id: UUID = UUID()
    var medicine :String
    var expirationDate :Date
    var state :MedState
}

