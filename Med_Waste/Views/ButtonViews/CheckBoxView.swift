//
//  CheckBoxView.swift
//  Med
//
//  Created by Jasmine Aufiero on 03/06/22.
//

import SwiftUI

struct CheckBoxView: View {
    
    @Binding var isTheSameDate :Bool
    
    var body: some View {
        
        HStack {
            isTheSameDate ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "circle")
            Text("Tutte le scatole hanno la stessa data di scadenza")
                .font(.caption)
        }
    }
}

//struct CheckBoxView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckBoxView()
//    }
//}
