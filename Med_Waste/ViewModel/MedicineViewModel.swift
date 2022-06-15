//
//  MedicineViewModel.swift
//  Med
//
//  Created by Jasmine Aufiero on 03/06/22.
//

import Foundation
import SwiftUI

class MedicineViewModel :ObservableObject {
    
    @Published var medicines :[MedData] = [
        MedData(name: "Tachipirina", dosage: "100 mg", type: "compresse", price: "9,00 €",  units: 30, category: "antivirale", isPinned: false),
        MedData(name: "Ayrinal", dosage: "100 mg", type: "compresse", price: "10,90 €",  units: 30, category: "antistaminico", isPinned: false)
        
    ]
    
    // this function create a json file to manage persistence if is not created yet
    init() {
        if let data = UserDefaults.standard.data(forKey: "SavedData") {
            if let decoded = try? JSONDecoder().decode([MedData].self, from: data) {
                medicines = decoded
                return
            }
        }
        
        medicines = []
    }
   
    // this function saves a medicine inside a json file
    func save() {
        if let encoded = try? JSONEncoder().encode(medicines) {
            UserDefaults.standard.set(encoded, forKey: "SavedData")
        }
    }
    
    
    // this function returns all the pinned medicines
    func pinnedMedicine() -> [MedData] {
        return medicines.filter{$0.isPinned}
    }
   
    // this function pin the medicine
    func pinMedicine(nome: String) {
        let index = medicines.firstIndex{ $0.name == nome }
        medicines[index!].isPinned.toggle()
        objectWillChange.send()
        save()
    }
    
    // find the medicine by using name
    func searchMedicineByName(medicine :String) -> MedData? {
        
        for i in 0..<medicines.count{
            if medicines[i].name == medicine {
                return medicines[i]
            }
        }
        return nil
    }
    
    // find all the medicine by category
    func searchMedicineByCategory(category :String) -> MedData? {
        
        for i in 0..<medicines.count{
            if medicines[i].category == category {
                return medicines[i]
            }
        }
        return nil
    }
    
    // this function search the medicines by passing the collected boxes
    func filterMedicinesFromBoxes(boxes: [MedBox]) -> [MedData] {
        var medicines :Set<MedData> = []
        for box in boxes {
            medicines.insert(searchMedicineByName(medicine: box.medicine)!) // by using the set, one medicine should be saved only one time
        }
        return Array(medicines)
    }
    
    
    
    // this function add a new medicine inside the cabinet
    func addNewMedicine(name :String, dosage: String, type :String, price :String, units :Int, category :String, isPinned: Bool) {
        
        medicines.append(MedData(name: name, dosage: dosage, type: type, price: price, units: units, category: category, isPinned: isPinned))
        save()
    }
    
    
    func categoryColor (medicine: MedData) -> String {
        
        switch medicine.category {
        case "Antibiotici":
            return "arancione"
        case "Antidolorifici":
//            return "arancione"
            return "rosso"
        case "Anti-Infiammatori":
//            return "arancione"
            return "nero"
        case "Antivirali":
            return "verde"
        case "Antistaminici":
            return "blu"
        case "Dermatologici":
//            return "verde"
            return "viola"
        case "Gastrointestinali":
            return "verde"
        case "Integratori":
            return "giallo"
        default:
            return "grigio"
        }
        
    }
    
    
    func chooseImage(type: String, medicine : MedData) -> String {
        
        switch type {
        case "Pillole":
            return "pillola\(categoryColor(medicine: medicine))"
            
        case "Bustine":
            return "bustina\(categoryColor(medicine: medicine))"
            
        case "Pomata":
            return "pomata\(categoryColor(medicine: medicine))"
            
        case "Sciroppo":
            return "sciroppo\(categoryColor(medicine: medicine))"
            
            
        case "Fiala":
            return "fiala\(categoryColor(medicine: medicine))"
            
        default:
            return "pillolagrigio"
            //        case "granulato":
            //            return "bustine_image"
            //
            //        case "compresse":
            //            return "compresse_image"
            //
            //        case "capsule":
            //            return "capsule_image"
            //
            
            //
            //        case "sciroppo":
            //            return "sciroppo_image"
            //
            //        case "soluzione_iniettabile":
            //            return "soluzione_image"
            //
            //        case "soluzione orale":
            //            return "spray_image"
            //
            //        case "spray":
            //            return "spray_image"
            
            
       
        }
    }
    
}

