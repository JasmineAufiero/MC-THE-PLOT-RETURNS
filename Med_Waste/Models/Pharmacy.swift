//
//  Pharmacy.swift
//  MedWaste
//
//  Created by Francesco on 31/05/22.
//

import Foundation
import MapKit

struct Pharmacy: Identifiable, Equatable{
    
    let name : String
    let cityName : String
    let provincia : String
    let street : String
    let cap: String
    let coordinates : CLLocationCoordinate2D
    let phone : String
    let donation : Bool
    let dispose : Bool
    
    
    var id : String {
        name+cityName
    }
    
    static func == (lhs: Pharmacy, rhs: Pharmacy) -> Bool {
        lhs.id == rhs.id
    }
    
}
