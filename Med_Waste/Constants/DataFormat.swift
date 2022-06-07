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
      formatter.dateFormat = "MM/dd/yy"
      return formatter
   }()
}


extension Date {
   func formatToString(using formatter: DateFormatter) -> String {
      return formatter.string(from: self)
   }
}


