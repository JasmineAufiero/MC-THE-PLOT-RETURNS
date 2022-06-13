//
//  DuckView.swift
//  Med_Waste
//
//  Created by Francesco on 13/06/22.
//

import SwiftUI

struct DuckView: View {
    var body: some View {
        Image("duck")
            .resizable()
            .scaledToFit()
    }
}

struct DuckView_Previews: PreviewProvider {
    static var previews: some View {
        DuckView()
    }
}
