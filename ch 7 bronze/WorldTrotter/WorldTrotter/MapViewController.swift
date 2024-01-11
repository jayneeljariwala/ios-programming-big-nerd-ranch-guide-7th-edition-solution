//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Jayneel Jariwala on 14/12/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        super.loadView()
        mapView = MKMapView()
        self.view = mapView
        
        let standardStr = NSLocalizedString("Standard", comment: "Standard view of map")
        let hybridStr = NSLocalizedString("Hybrid", comment: "Hybrid view of map")
        let satelliteStr = NSLocalizedString("Satellite", comment: "Satellite view of map")
        
        let segmentedControl = UISegmentedControl(items: [standardStr, hybridStr, satelliteStr])
        segmentedControl.backgroundColor = .systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print("MapViewController loaded its view")
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
}
