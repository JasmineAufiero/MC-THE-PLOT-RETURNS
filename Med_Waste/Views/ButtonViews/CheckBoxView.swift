//
//  CheckBoxView.swift
//  Med
//
//  Created by Jasmine Aufiero on 03/06/22.
//

import SwiftUI

struct CheckBoxView: View {
    
    @Binding var isTheSameDate :Bool
    var TextString = "All the boxes have the same expiration date"
    var body: some View {
        
        HStack {
            isTheSameDate ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "circle")
            Text(LocalizedStringKey(String(TextString)))
                .font(.caption)
        }
    }
}

//struct CheckBoxView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckBoxView()
//    }
//}
