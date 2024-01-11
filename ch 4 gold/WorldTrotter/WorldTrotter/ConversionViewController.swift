//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Jayneel Jariwala on 12/12/23.
//

import UIKit

class ConversionViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = [UIColor.red, UIColor.white, UIColor.blue, UIColor.green, UIColor.gray].randomElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view")
    }
    
}

