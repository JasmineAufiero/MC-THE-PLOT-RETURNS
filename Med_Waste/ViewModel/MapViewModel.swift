//
//  MapViewModel.swift
//  MedWaste
//
//  Created by Francesco on 31/05/22.
//

import Foundation
import MapKit

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var showMap : Bool = false
    
    @Published var locations : [Pharmacy]
    
    override init(){
        let locations = PharmaciesDataServices.locations
        self.locations = locations
    }
    
    var locationManager: CLLocationManager?
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(
        latitude: 40.7,
        longitude: -74),
        span: MKCoordinateSpan(
            latitudeDelta: 0.1,
            longitudeDelta: 0.1))
    
    func checkIfLocationServiceIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Alert")
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
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        @unknown default:
            break
        }
        

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
        
    }
}
