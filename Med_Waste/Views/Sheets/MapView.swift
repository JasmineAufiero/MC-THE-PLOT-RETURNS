//
//  MapView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is the Map used for showing all the pharmacys.

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var locationManagerK : MapViewModel
    
    var body: some View {
             ZStack {
                 map
             }
             .overlay(closeMapButtpm, alignment: .topTrailing)
    }
}

extension MapView {
    private var closeMapButtpm: some View {
        Button {
            print("I Like Ducks")
            locationManagerK.showMap = false
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
//                .padding(16)
                .frame(width: 50, height: 50)
                .foregroundColor(.purple)
                .background(.thickMaterial)
                .cornerRadius(20)
                .shadow(radius: 4)
                .padding()        }

    }
    
    private var map: some View {
        Map(coordinateRegion: $locationManagerK.region,
            showsUserLocation: true,
            annotationItems: locationManagerK.locations,
            annotationContent: { pharma in
            MapAnnotation(coordinate: pharma.coordinates){
                if(pharma.donation == true && pharma.dispose == true){
                    Image(systemName: "pills.fill")
                        .shadow(radius: 10)
                        .foregroundColor(.yellow)
                }
                
                if(pharma.donation == true && pharma.dispose == false){
                    Image(systemName: "pills.fill")
                        .shadow(radius: 10)
                        .foregroundColor(.green)
                }
                
                if(pharma.donation == false && pharma.dispose == true){
                    Image(systemName: "pills.fill")
                        .shadow(radius: 10)
                        .foregroundColor(.purple)
                }
            }
        })
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear{
                locationManagerK.checkIfLocationServiceIsEnabled()
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

