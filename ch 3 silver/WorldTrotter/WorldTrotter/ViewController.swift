//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Jayneel Jariwala on 12/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    let rainbowLayer = {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor.purple.cgColor,
            UIColor.blue.cgColor,
            UIColor.green.cgColor,
            UIColor.yellow.cgColor,
            UIColor.orange.cgColor,
            UIColor.red.cgColor
        ]
        return layer
    }()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        rainbowLayer.frame = view.bounds
        view.layer.insertSublayer(rainbowLayer, at: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

