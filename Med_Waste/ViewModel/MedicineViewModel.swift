//
//  MedicineViewModel.swift
//  Med
//
//  Created by Jasmine Aufiero on 03/06/22.
//

import Foundation

class MedicineViewModel :ObservableObject {
    
    @Published var medicines :[MedData] = [
        MedData(name: "Tachipirina", dosage: "100 mg", type: "compresse", price: "9,00 €",  units: 30, category: "antivirale", isPinned: false),
        MedData(name: "Ayrinal", dosage: "100 mg", type: "compresse", price: "10,90 €",  units: 30, category: "antistaminico", isPinned: false)
    
    ]
    
//    @Published var pinnedMedicines :[MedData] = [
////        MedData(name: "Ayrinal", dosage: "100 mg", type: "compresse", price: "10,90 €",  units: 30, category: "antistaminico")
//    ]
    
    
    func addNewMedicine(name :String, dosage: String, type :String, price :String, units :Int, category :String, isPinned: Bool) {
        medicines.append(MedData(name: name, dosage: dosage, type: type, price: price, units: units, category: category, isPinned: isPinned))
    }
//    
//    func addPinnedMedicines(name :String, dosage: String, type :String, price :String, units :Int, category :String) {
//        pinnedMedicines.append(MedData(name: name, dosage: dosage, type: type, price: price, units: units, category: category))
//    }
//    
//    func isPinnedMedicine(name: String) -> Bool {
//        for medicine in pinnedMedicines {
//            if medicine.name == name {
//                return true
//            }
//        }
//        return false
//    }
//    
//    func removePinnedMedicines(name: String) {
//        if !pinnedMedicines.isEmpty {
//            for index in 0...pinnedMedicines.count-1 {
//                if pinnedMedicines[index].name == name {
//                    pinnedMedicines.remove(at: index)
//                }
//            }
//        }
//    }
    
    
    
    
    func chooseImage(type: String) -> String {
        
        switch type {
        case "tubo":
            return "tubo_image"
            
        case "pomata":
            return "tubo_image"
            
        case "integratore":
            return "integratore_image"
            
        case "granulato":
            return "bustine_image"
            
        case "compresse":
            return "compresse_image"
            
        case "capsule":
            return "capsule_image"
            
        case "gocce":
            return "gocce_image"
            
        case "sciroppo":
            return "sciroppo_image"
            
        case "soluzione_iniettabile":
            return "soluzione_image"
            
        case "soluzione orale":
            return "spray_image"
        
        case "spray":
            return "spray_image"
            
            
        default:
            return "pills"
        }
    }
    
}

