//
//  RecognisedData.swift
//  Med_Waste
//
//  Created by Irene Fernando on 14/06/22.
//

import Foundation

class RecognizedData {
    

    func getName(text : String) -> String {
        let regex = try! NSRegularExpression(pattern: #"^[^0-9]+ "# )
        let match = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))
        let array = match.map({(text as NSString).substring(with: $0.range(at: 0))})
        if !array.isEmpty{
            return array[0]
        }else{
            return ""
        }
    }

    func getDosage(text : String) -> String {
        let regex = try! NSRegularExpression(pattern: #"([0-9]+) (mg|ml)"#)
        let match = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))
        let array = match.map({(text as NSString).substring(with: $0.range(at: 0))})
        if !array.isEmpty{
            return array[0]
        }else{
            return ""
        }
    }

    func getType(text : String) -> String {
        let regex = try! NSRegularExpression(pattern: #"(compresse|bustine|sciroppo|crema|fiala|fanconcino|fiale)"# )
        let match = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))
        let array = match.map({(text as NSString).substring(with: $0.range(at: 0))})
        if !array.isEmpty{
            return array[0].lowercased()
        }else{
            return ""
        }
     
    }

    func getPrice(text : String) -> String {
        let regex = try! NSRegularExpression(pattern: #"([0-9]+)(,)([0-9]+)"# )
        let match = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))
        let array = match.map({(text as NSString).substring(with: $0.range(at: 0))})
        if !array.isEmpty{
            return array[0]
        }else{
            return ""
        }
    }

    func getUnits(text : String) -> String {
//        let regex = try! NSRegularExpression(pattern: #" ([0-9]){2} "# )
        
        
        let regex = try! NSRegularExpression(pattern: #"([0-9]+ (compresse|bustine))"# )
//        let regex = try! NSRegularExpression(pattern: #" (\d+) (?i:compresse|bustine|%) "# )
        let match = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))
        let array = match.map({(text as NSString).substring(with: $0.range(at: 0))})
        if !array.isEmpty{
            print(array[0])
            return array[0]
        }else{
            return ""
        }
        
    }

    func getDate(text : String) -> Date? {
        let regex = try! NSRegularExpression(pattern: #"(?:[0-9]{2})[/| ](?:[0-9]{4})"# )
        let match = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))
        let array = match.map({(text as NSString).substring(with: $0.range(at: 0))})
        if !array.isEmpty{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.date(from: "01/" + array[0])
            
        } else{
            return Date.now
        }
       
    }
    
    func getTypeName(type : String) -> String {

        switch type {
        case "compresse" :
            return "Pillole"
        case "bustine" :
            return "Bustine"
        case "sciroppo" :
            return "Sciroppo"
        case "crema" :
            return "Pomate"
        case "fiala" :
            return "Fiala"
        case "fiale" :
            return "Fiala"
        case "falconcino" :
            return "Fiala"
        default:
            return "Pillole"
        }
    }

}


