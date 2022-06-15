//
//  MapViewModel.swift
//  MedWaste
//
//  Created by Francesco on 31/05/22.
//

import Foundation
import MapKit
import SwiftUI

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var showMap : Bool = false
    
    @Published var duckCount :Int = 0
    
    @Published var mapSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)

    @Published var locations : [Pharmacy]
    
    @Published var mapLocation: Pharmacy {
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    override init(){
        let locations = PharmaciesDataServices.locations
        self.locations = locations
        self.mapLocation = locations.first!
//        self.updateMapRegion(location: locations.first!)
    }
    
    var locationManager: CLLocationManager?
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(
        latitude: 40.7,
        longitude: -74),
        span: MKCoordinateSpan(
            latitudeDelta: 0.1,
            longitudeDelta: 0.1))
    
    private func updateMapRegion(location: Pharmacy) {
        withAnimation(.easeInOut){
            region = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func checkIfLocationServiceIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Alert")
        }
    }
    
    func showNextPharma(location : Pharmacy){
        withAnimation(.easeInOut) {
            mapLocation = location
        }
    }
    
    func checkLocationAuthorization(){
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Restricted")
        case .denied:
            print("Denied")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: mapSpan)
        @unknown default:
            break
        }
        

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
        
    }
}
