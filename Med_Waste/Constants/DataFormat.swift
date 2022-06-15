//
//  DataFormat.swift
//  Med_Waste
//
//  Created by Jasmine Aufiero on 07/06/22.
//

import Foundation

extension DateFormatter {
    
   static let MMddyy: DateFormatter = {
      let formatter = DateFormatter()
      formatter.timeZone = TimeZone(abbreviation: "UTC") //TimeZone.current
      formatter.dateFormat = "dd/MM/yy"
      return formatter
   }()
}


extension Date {
   func formatToString(using formatter: DateFormatter) -> String {
      return formatter.string(from: self)
   }
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}


 extension Double {
/// returns number of digits in Int number
 var digitCount: Int {
    get {
        return numberOfDigits(in: self)
    }
}


// private recursive method for counting digits
private func numberOfDigits(in number: Double) -> Int {
    if number < 10 && number >= 0 || number > -10 && number < 0 {
        return 1
    } else {
        return 1 + numberOfDigits(in: number/10)
    }
}
}

extension String {
    static let numberFormatter = NumberFormatter()
    var doubleValue: Double {
        String.numberFormatter.decimalSeparator = "."
        if let result =  String.numberFormatter.number(from: self) {
            return result.doubleValue
        } else {
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
}



extension NumberFormatter {
    convenience init(style: Style) {
        self.init()
        self.numberStyle = style
    }
}
extension Formatter {
    static let currency = NumberFormatter(style: .currency)
}
extension FloatingPoint {
    var currency: String {
        return Formatter.currency.string(for: self) ?? ""
    }
}
