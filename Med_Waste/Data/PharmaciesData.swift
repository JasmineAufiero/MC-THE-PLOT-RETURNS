//
//  PharmaciesData.swift
//  Med_Waste
//
//  Created by Francesco on 12/06/22.
//

import Foundation
import MapKit

class PharmaciesDataServices {
    static let locations : [Pharmacy] = [
        Pharmacy(name: "Antica Farmacia Centrale Scala",
                 cityName: "Nola",
                 provincia: "NA",
                 street: "Corso Tommaso Vitale 76",
                 cap: 80035,
                 coordinates: CLLocationCoordinate2D(latitude: 40.9259222668902, longitude: 14.527577755513166),
                 phone: 0818231788,
                 donation: true,
                 dispose: false),
        
        Pharmacy(name: "Antica Farmacia De Palma",
                 cityName: "Cicciano",
                 provincia: "NA",
                 street: "Via Roma 2",
                 cap: 80033,
                 coordinates: CLLocationCoordinate2D(latitude: 40.962486807623776, longitude: 14.538146569007942),
                 phone: 3467575153,
                 donation: false,
                 dispose: true),
        
        Pharmacy(name: "Farmacia Alfani Dott. Arturo",
                 cityName: "Napoli  ",
                 provincia: "NA",
                 street: "Via Francesco Cilea 22",
                 cap: 80127,
                 coordinates: CLLocationCoordinate2D(latitude: 40.84440135668942, longitude: 14.22061275665357),
                 phone: 0817283024,
                 donation: true,
                 dispose: true)
        
    ]
}
