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
        MedData(name: "Tachipirina", dosage: "100 mg", type: "compresse", price: "9,00 €",  units: "30 compresse", category: "antivirale", isPinned: false),
        MedData(name: "Ayrinal", dosage: "100 mg", type: "compresse", price: "10,90 €",  units: "30 compresse", category: "antistaminico", isPinned: false)
        
    ]
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "SavedData") {
            if let decoded = try? JSONDecoder().decode([MedData].self, from: data) {
                medicines = decoded
                return
            }
        }
        
        medicines = []
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(medicines) {
            UserDefaults.standard.set(encoded, forKey: "SavedData")
        }
    }
    
    
    
    func pinnedMedicine() -> [MedData] {
        return medicines.filter{$0.isPinned}
    }
    
    func pinMedicine(nome: String) {
        let index = medicines.firstIndex{ $0.name == nome }
        medicines[index!].isPinned.toggle()
        objectWillChange.send()
        save()
    }
    
    
    func searchMedicineByName(medicine :String) -> MedData? {
        
        for i in 0..<medicines.count{
            if medicines[i].name == medicine {
                return medicines[i]
            }
        }
        return nil
    }
    
    
    func searchMedicineByCategory(category :String) -> MedData? {
        
        for i in 0..<medicines.count{
            if medicines[i].category == category {
                return medicines[i]
            }
        }
        return nil
    }
    
    
    
    
    
    func addNewMedicine(name :String, dosage: String, type :String, price :String, units : String, category :String, isPinned: Bool) {
        
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
            return "grigio"
//            return "verde"
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
    
        }
    }
    
}

