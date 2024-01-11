//
//  ViewController.swift
//  Buggy
//
//  Created by Jayneel Jariwala on 01/01/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Method: \(#function) in File : \(#file) line : \(#line) called.")
        
        badMethod()
    }
    
    func badMethod() {
        let array = NSMutableArray()
        
        for i in 0..<10 {
            array.insert(i, at: i)
        }
        
        //Go one step too far emptying the array (noticing the range change):
        for _ in 0..<10 {
            array.removeObject(at: 0)
        }
    }

}

