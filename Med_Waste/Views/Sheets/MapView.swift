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
                 // Easter Egg
                 if(locationManagerK.duckCount == 5){
                    DuckView()
                 }
                 VStack(spacing:0){
                     Spacer()
                     pharmacyPreview
                 }
             }
             .overlay(closeMapButtpm, alignment: .topTrailing)
    }
}

extension MapView {
    private var closeMapButtpm: some View {
        Button {
            print("I Like Ducks")
            locationManagerK.duckCount += 1
            locationManagerK.showMap = false
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
//                .padding(16)
                .frame(width: 50, height: 50)
                .foregroundColor(Color("AccentColor"))
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
                    PinView(imgName: "throwDonate")
                        .scaleEffect(locationManagerK.mapLocation == pharma ? 1 : 0.7)
                        .onTapGesture {
                            locationManagerK.showNextPharma(location: pharma)
                        }
                }
                
                if(pharma.donation == true && pharma.dispose == false){
                    PinView(imgName: "donate")
                        .scaleEffect(locationManagerK.mapLocation == pharma ? 1 : 0.7)
                        .onTapGesture {
                            locationManagerK.showNextPharma(location: pharma)
                        }

                }
                
                if(pharma.donation == false && pharma.dispose == true){
                    PinView(imgName: "dispose")
                        .scaleEffect(locationManagerK.mapLocation == pharma ? 1 : 0.7)
                        .onTapGesture {
                            locationManagerK.showNextPharma(location: pharma)
                        }

                }
            }
        })
            .ignoresSafeArea()
            .accentColor(Color("AccentColor"))
            .onAppear(perform: {
                locationManagerK.checkIfLocationServiceIsEnabled()
            })
    }
    
    private var pharmacyPreview: some View {
        ZStack{
            ForEach(locationManagerK.locations) { pharma in
                if(locationManagerK.mapLocation == pharma) {
                    PharmacyPreview(location: pharma)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(MedicineViewModel())
    }
}

