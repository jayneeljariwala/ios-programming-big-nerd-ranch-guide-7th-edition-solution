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
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        let label = UILabel()
        let swtch = UISwitch()
        swtch.isOn = true
        swtch.addTarget(self, action: #selector(changeSwitch(_:)), for: .valueChanged)
        swtch.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Points of Interest"
        label.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.backgroundColor = .systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        view.addSubview(label)
        view.addSubview(swtch)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        let labelTopConstraint = label.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 12)
        let labelLeadingConstraint = label.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
        labelTopConstraint.isActive = true
        labelLeadingConstraint.isActive = true
        
        let swtchLeadingConstraint = swtch.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 3)
        let swtchTopConstraint = swtch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
        swtchTopConstraint.isActive = true
        swtchLeadingConstraint.isActive = true
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
    
    @objc func changeSwitch(_ swi: UISwitch) {
        if swi.isOn {
            mapView.pointOfInterestFilter = .includingAll
        } else {
            mapView.pointOfInterestFilter = .excludingAll
        }
    }
    
}
