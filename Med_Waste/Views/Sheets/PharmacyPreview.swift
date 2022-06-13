//
//  PharmacyPreview.swift
//  Med_Waste
//
//  Created by Francesco on 12/06/22.
//

import SwiftUI

struct PharmacyPreview: View {
    @EnvironmentObject var locationManagerK : MapViewModel
    let location: Pharmacy

    var body: some View {
        HStack{
            VStack{
                infoSection
            }
        }
    }
}

extension PharmacyPreview {
    private var imageSection : some View {
        Text("Yea")
    }
    
    private var infoSection : some View {
    
        VStack{
        Text(location.name)
        
        Text(location.cityName)
        }
    }
}

struct PharmacyPreview_Previews: PreviewProvider {
    static var previews: some View {
        PharmacyPreview(location: PharmaciesDataServices.locations.first!)
    }
}
