//
//  BoxViewModel.swift
//  Med
//
//  Created by Jasmine Aufiero on 04/06/22.
//

import Foundation
import SwiftUI


class BoxViewModel :ObservableObject {
    
    @Published var boxes :[MedBox] = [
        MedBox(medicine: "Tachipirina", expirationDate: Date.now.addingTimeInterval(86500), state: .usable),
        MedBox(medicine: "Tachipirina", expirationDate: Date.now, state: .usable),
        MedBox(medicine: "Ayrinal", expirationDate: Date.now, state: .usable)
    ]
    
    
    // this function allows to filter boxes by medicine name
    func filterBoxesForMedicine(medicine :String) -> [MedBox] { // this function could return a nil value
        var boxesForMedicine :[MedBox] = []
        
        for item in boxes { // filter the data from boxes based on the name of the medicine
            if item.medicine == medicine {
                boxesForMedicine.append(item) // add the boxes inside an array
            }
        }
        return boxesForMedicine // return all the boxes related to that medicine
        
    }
    
//    func filerAboutToExpireMedicines(name: String) -> [MedData] {
//        var aboutToExpire :[MedData] = []
//
//        for medicine in medicines {
//            if medicine.date
//        }
//    }
    
    func filterExpiredBoxes(name: String) {
        var expiredBoxes :[MedBox] = []
        
        for box in boxes {
            if box.expirationDate > Date.now {
                expiredBoxes.append(box)
            }
        }
    }
    
//    function that allowa to understand when a med is donable (more than 6-8 months prior the expiration date)
    
//    func filterDonableMedicinesBoxes (name: String){
//        var donableBoxes :[MedBox] = []
//
//        for box in boxes {
//            if (box.expirationDate < ) {
//
//            }
//        }
//
//
//    }
    
    
    func addNewBox(medicine: String, expirationDate: Date, state :MedState) {

        boxes.append(MedBox(medicine: medicine, expirationDate: expirationDate, state: state))
//        medicineViewModel.addBox(MedBox(medicine: medicine, expirationDate: expirationDate, state: state)

    }
    
    
}
