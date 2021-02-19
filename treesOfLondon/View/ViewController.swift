//
//  ViewController.swift
//  treesOfLondon
//
//  Created by Andras Pal on 14/04/2020.
//  Copyright © 2020 Andras Pal. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet private var mapView: MKMapView!
    
    @IBAction private func infoBtnPressed(_ sender: UIButton) {
        let infoPanel = InfoPanelController()
        infoPanel.modalPresentationStyle = .fullScreen
        present(infoPanel, animated: true, completion: nil)
    }
    
    @IBAction private func locationBtnPressed(_ sender: UIButton) {
        
        updateLocationService()
        
        if checkLocationService() == LocationServiceStatus.authInUseAlways {
            print("Location: \(String(describing: locationManager.location?.coordinate))")
            let isUserInLondon: Bool = checkLocation(latitude: Double((locationManager.location?.coordinate.latitude ?? 0.1)), longitude: Double((locationManager.location?.coordinate.longitude ?? 0.1)))
            print(("User is in London: \(isUserInLondon)"))
            if isUserInLondon { currentLocation() }
        }
    }
    
    @IBOutlet private weak var locationButton: UIButton!
    @IBOutlet private weak var infoButton: UIButton!
    
    private var trees: [Trees] = []
    
    fileprivate let locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        return manager
    }()
    
    override func viewDidLoad() {
        
        //        mapView.delegate = self
        
        super.viewDidLoad()
        
        mapView.register(
            TreeMarkerView.self,
            forAnnotationViewWithReuseIdentifier:
                MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        // Set initial location in London
        //        let initialLocation = CLLocation(latitude: 51.501122, longitude: -0.146041)
        let londonCenter = CLLocation(latitude: 51.5007, longitude: -0.1246)
        
        mapView.centerToLocation(londonCenter)
        let region = MKCoordinateRegion(
            center: londonCenter.coordinate,
            latitudinalMeters: 60000,
            longitudinalMeters: 60000)
        mapView.setCameraBoundary(
            MKMapView.CameraBoundary(coordinateRegion: region),
            animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 3000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        locationButton.buttonShadow()
        infoButton.buttonShadow()
        loadInitialData()
        mapView.addAnnotations(trees)
        setUpMapView()
    }
    
    private func setUpMapView() {
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        mapView.showsScale = true
        currentLocation()
    }
    
    private func currentLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if #available(iOS 11.0, *) {
            locationManager.showsBackgroundLocationIndicator = true
        } else {
            // Fallback on earlier versions
        }
        locationManager.startUpdatingLocation()
    }
    
    func checkLocation(latitude: Double, longitude: Double) -> Bool {
        
        if (latitude > 49 && latitude < 53) && (longitude > -1 && longitude < 3) {
            return true
        } else {
            return false
        }
    }
    
    private func loadInitialData() {
        // 1
        guard
            let fileName = Bundle.main.url(forResource: "londonTrees_Final", withExtension: "geojson"),
            let treeData = try? Data(contentsOf: fileName)
        else {
            return
        }
        
        do {
            // 2
            let features = try MKGeoJSONDecoder()
                .decode(treeData)
                .compactMap { $0 as? MKGeoJSONFeature }
            // 3
            let allTrees = features.compactMap(Trees.init)
            // 4
            trees.append(contentsOf: allTrees)
        } catch {
            // 5
            print("Unexpected error: \(error).")
        }
    }
}

//MARK: - Extensions

private extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last! as CLLocation
        let currentLocation = location.coordinate
        let coordinateRegion = MKCoordinateRegion(center: currentLocation, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(coordinateRegion, animated: true)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }

    /// For checking the authorizationStatus of the CLLocationManager
    /// - Returns: A LocationServiceStatus enum case
    func checkLocationService() -> LocationServiceStatus {
        /// Check if the app can use Location Services
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                return .notDetermined
            case .restricted, .denied:
                return .restrictedDenied
            case .authorizedWhenInUse, .authorizedAlways:
                return .authInUseAlways
            @unknown default:
                return .unknownDefault
            }
        } else {
            return .unknownDefault
        }
    }
    
    /// For handling the different cases of the CLLocationManager's authorization statuses
    /// Can request access to the location services or continue running if already has access
    func updateLocationService() {
        /// Check if user has authorized the app to use Location Services
        if CLLocationManager.locationServicesEnabled() {
            
            switch checkLocationService() {
            
            case .notDetermined:
                // Request using the location service
                self.locationManager.delegate = self
                locationManager.requestWhenInUseAuthorization()
                break
                
            case .restrictedDenied:
                // Creating an alert to use the location service
                let alert = UIAlertController(title: "Allow Location Access", message: "London Trees needs access to your location. Turn on Location Services in your device settings.", preferredStyle: UIAlertController.Style.alert)

                // Alert to Open Settings
                alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: { action in
                    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                        return
                    }
                    if UIApplication.shared.canOpenURL(settingsUrl) {
                        UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                            print("Settings opened: \(success)")
                        })
                    }
                }))
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                break
                
            case .authInUseAlways:
                // Enable features that require location services here.
                print("Has access to location")
                break
                
            case .unknownDefault:
                fatalError()
            }
        }
    }
}
