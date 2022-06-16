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
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "SavedBoxes") {
            if let decoded = try? JSONDecoder().decode([MedBox].self, from: data) {
                boxes = decoded
                return
            }
        }

        boxes = []
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(boxes) {
            UserDefaults.standard.set(encoded, forKey: "SavedBoxes")
        }
    }
    
//    func getMedData() -> MedData {
////        var expiredBoxes :[MedBox] = []
//        var SpecificMedData : MedData =
//        
//    }
    
    
//    function that allows to understand when a box is expired yet
    func filterExpiredBoxes() -> [MedBox] {
//        var expiredBoxes :[MedBox] = []
        var expiredBoxes :[MedBox] = []
        
        for box in boxes { // add the box only if is expired
            if box.expirationDate > Date.now {
                expiredBoxes.append(box)
            }
        }
        return expiredBoxes
    }
    
//    function that allows to understand when a med is donable (more than 6-8 months prior the expiration date)
    
    func filterDonableBoxes () -> [MedBox] {
        let eightmonths = Date().addingTimeInterval(8 * 30 * 24.0 * 3600.0) // timeInterval is meaured in seconds, so multiplying 8 months * 30 (typically the number of days in a month) *  24 (the number of hours in a day) * 36000 (the number of seconds in an hour)
        
        var donableBoxes :[MedBox] = []

        for box in boxes {
            if box.expirationDate > eightmonths {
                donableBoxes.append(box)
            }
        }
        return donableBoxes
    }
    
    
//    function that allows to understand when a med is about to expire (less than 6 months prior the expiration date)
    func filterAboutToExpireBoxes () -> [MedBox] {
        let sixmonths = Date().addingTimeInterval(6 * 30 * 24.0 * 3600.0)
        let dateComponentsFormatter = DateComponentsFormatter()
        var aboutToExpireBoxes :[MedBox] = []

        for box in boxes {

            if (Date.now).timeIntervalSince(box.expirationDate) / (30 * 24.0 * 3600.0) <= 6 // if the expiration date is less than 6 months since today: monthsbetweenDates = Int((distanceBetweenDates! / secondsInMonths))
            {
                aboutToExpireBoxes.append(box)
            }
        }
        return aboutToExpireBoxes
    }
    
    
    func newExpirationDate(box : inout MedBox, expirationDate: Date) {
        box.expirationDate = expirationDate
        save()
    }
    
//  function that add a new box of a medicine who is already added
    
    func addNewBox(medicine: String, expirationDate: Date, state :MedState) {
        
        boxes.append(MedBox(medicine: medicine, expirationDate: expirationDate, state: state))
        //        medicineViewModel.addBox(MedBox(medicine: medicine, expirationDate: expirationDate, state: state)
        save()
    }

    func del() {

            if let encoded = try? JSONEncoder().encode(boxes) {

                UserDefaults.standard.removeObject(forKey: "SavedBoxes")

            }

        }

        

        func deleteBox(indexx:Int){

            boxes.remove(at: indexx)

            del()

        }
    
}
