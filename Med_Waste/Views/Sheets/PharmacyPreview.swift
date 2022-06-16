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
        HStack(){
            imageSection
            VStack(alignment:.leading ,spacing:16){
                infoSection
                HStack(spacing:100){
                    donateDisposeIcon
                    goButton
                }
            }
            
        }
        .padding(20)
        .background{
        RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
//            .offset(y:65)
        }
        .cornerRadius(10)
//        .shadow(radius: 10)
        
    }
}

extension PharmacyPreview {
    private var imageSection : some View {
        ZStack{
        Image("pharmaLogo")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .cornerRadius(10)
        }
        .padding(6)
        .background(Color("DonatedGreen"))
        .cornerRadius(10)
        
    }
    
    private var infoSection : some View {
    
        VStack(alignment: .leading, spacing: 4){
        Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
        
            Text("\(location.street), \(location.cap), \(location.cityName), \(location.provincia), \(location.phone)")
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var goButton: some View {
        Button {
            let url = URL(string: "maps://?daddr=\(location.coordinates.latitude),\(location.coordinates.longitude)")
            if UIApplication.shared.canOpenURL(url!) {
                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            }
        }
            label: {
            Text(LocalizedStringKey(String("Map")))
                .font(.headline)
                .frame(width: 80, height: 20)
                .padding(7)
                .background(Color("AccentColor"))
                .cornerRadius(10)
                .foregroundColor(.black)
        }

    }
    
    private var donateDisposeIcon: some View {
        HStack(spacing:15){
            ZStack{
                Image(systemName: "hand.wave.fill")
                Image(systemName: "pills.fill").scaleEffect(0.4).offset(x:3, y: -9)
                }
                .offset(y:2)
                .foregroundColor(location.donation ? Color("AccentColor") : Color.gray)
                .imageScale(.large)

            Image(systemName: "trash.fill")
                .foregroundColor(location.dispose ? Color("AccentColor") : Color.gray)
                .imageScale(.large)
        }
    }
}

struct PharmacyPreview_Previews: PreviewProvider {
    static var previews: some View {
        PharmacyPreview(location: PharmaciesDataServices.locations.first!)
    }
}
