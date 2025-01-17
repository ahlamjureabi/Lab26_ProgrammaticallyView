//
//  ViewController.swift
//  lab_map
//
//  Created by Ahlam Ahlam on 03/05/1443 AH.
//

import UIKit
import MapKit



class ViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func  loadView() {
        
        
        
        mapView = MKMapView()
        view = mapView
//        info segment
        
        let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        view.addSubview(segmentedControl)
        
        segmentedControl.backgroundColor = .systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true

//        #info switch
        
        let switchView = UISwitch()
        view.addSubview(switchView)
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.onTintColor = .systemYellow
        
        let topConstraintSwitsh = switchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 55)
        
        let leadingConstraintSwitsh = switchView.leadingAnchor.constraint(equalTo: margins.leadingAnchor,constant: 150)
        
        let trailingConstraintSwitsh = switchView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        
        topConstraintSwitsh.isActive = true
        
        leadingConstraintSwitsh.isActive = true
        
        trailingConstraintSwitsh.isActive = true
        
        
//        info Label
        
        let labelView = UILabel()
        labelView.text = "Points of Interest"
        view.addSubview(labelView)
        
        
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let topConstraintLabel = labelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50)
        let leadingConstraintLabel = labelView.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraintLabel = labelView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraintLabel.isActive = true
        leadingConstraintLabel.isActive = true
        trailingConstraintLabel.isActive = true
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChange(_:)), for: .valueChanged)
        
        switchView.addTarget(self, action: #selector( pointLocation(_:)),for: .valueChanged)
        
    }
    
    
    @objc func mapTypeChange(_ segmented: UISegmentedControl){
        switch segmented.selectedSegmentIndex{
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            print("⚠️ Erorr ⚠️")
        }
    }
//    funcation for switch
    
    @objc func pointLocation(_ switchV:UISwitch){
        if switchV.isOn{
            mapView.pointOfInterestFilter = .excludingAll
        }else{
            mapView.pointOfInterestFilter = .includingAll
        }
    }
}

