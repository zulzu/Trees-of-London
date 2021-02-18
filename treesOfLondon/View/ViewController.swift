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
        currentLocation()
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
        
        locationButton.buttonShadow()
        infoButton.buttonShadow()
        
        //        mapView.delegate = self
        
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
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 3000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
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
}
