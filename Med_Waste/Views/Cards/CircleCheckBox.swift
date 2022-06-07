//
//  CircleCheckBox.swift
//  MedWaste
//
//  Created by Irene Fernando on 03/06/22.
//

import SwiftUI

struct CircleCheckBox: View {
    var isSelected : Bool
    var state : String
    
    var body: some View {
        HStack(spacing: 10){
            
            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
            Text(state).font(.title3)  .multilineTextAlignment(.leading)
        }.frame(maxWidth : .infinity, alignment: .leading)
            .padding(10)
      
    }
}

struct CircleCheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CircleCheckBox(isSelected: false, state: "half")
    }
}
