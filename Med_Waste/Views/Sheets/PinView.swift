//
//  PinView.swift
//  Med_Waste
//
//  Created by Francesco on 13/06/22.
//

import SwiftUI

struct PinView: View {
    @State var imgName : String
    var body: some View {
        Image(imgName)
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
            .padding(6)
            .clipShape(Circle())
            .offset(y: -3)
            .shadow(radius: 10)
    }
}

struct PinView_Previews: PreviewProvider {
    static var previews: some View {
        PinView(imgName: "dispose")
    }
}
