//
//  DatePickerView.swift
//  Med_Waste
//
//  Created by Jasmine Aufiero on 07/06/22.
//

import SwiftUI

struct DatePickerView: View {
    @State var selection :Date
    var index :Int
    
    var body: some View {
        
        HStack {
            
            DatePicker("Box  \(index+1)", selection: $selection, in: Date()..., displayedComponents: .date)
            
            Spacer()
            
            Button {} label: {
                Image(systemName: "viewfinder") // add the possibility to scan
            }
        }
    }
}

//struct DatePickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        DatePickerView()
//    }
//}
