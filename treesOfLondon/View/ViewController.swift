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
    
    @IBAction func infoBtnPressed(_ sender: UIButton) {
        let infoPanel = InfoPanelController()
        infoPanel.modalPresentationStyle = .custom
        present(infoPanel, animated: true, completion: nil)
    }
    
    @IBAction func locationBtnPressed(_ sender: UIButton) {
        currentLocation()
    }
    
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    
    fileprivate let locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        return manager
    }()
    
    
    func setUpMapView() {
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        mapView.showsScale = true
        currentLocation()
    }
    
    func currentLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if #available(iOS 11.0, *) {
            locationManager.showsBackgroundLocationIndicator = true
        } else {
            // if needed
        }
        locationManager.startUpdatingLocation()
    }
    
    private var trees: [Trees] = []
    
    override func viewDidLoad() {
        
        locationButton.buttonShadow()
        infoButton.buttonShadow()
        
        super.viewDidLoad()
        
        mapView.register(
            TreeMarkerView.self,
            forAnnotationViewWithReuseIdentifier:
            MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        // Set initial location in London
        let initialLocation = CLLocation(latitude: 51.501122, longitude: -0.146041)
        mapView.centerToLocation(initialLocation)
        
        let londonCenter = CLLocation(latitude: 51.5, longitude: 0.0)
        let region = MKCoordinateRegion(
            center: londonCenter.coordinate,
            latitudinalMeters: 60000,
            longitudinalMeters: 60000)
        mapView.setCameraBoundary(
            MKMapView.CameraBoundary(coordinateRegion: region),
            animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 5000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        
        loadInitialData()
        mapView.addAnnotations(trees)
        setUpMapView()
        
    }
    
    private func loadInitialData() {
        guard
            let fileName = Bundle.main.url(forResource: "londonTrees_Final", withExtension: "geojson"),
            let treeData = try? Data(contentsOf: fileName)
            else {
                return
        }
        
        do {
            let features = try MKGeoJSONDecoder()
                .decode(treeData)
                .compactMap { $0 as? MKGeoJSONFeature }
            let allTrees = features.compactMap(Trees.init)
            trees.append(contentsOf: allTrees)
        } catch {
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
}


