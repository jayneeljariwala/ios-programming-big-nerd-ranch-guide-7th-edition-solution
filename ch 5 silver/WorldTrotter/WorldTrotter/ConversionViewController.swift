//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Jayneel Jariwala on 12/12/23.
//

import UIKit

class ConversionViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        let firstLbl = UILabel()
        let secondLbl = UILabel()
        let thirdLbl = UILabel()
        let fourthLbl = UILabel()
        let fifthLbl = UILabel()
        firstLbl.text = "212"
        secondLbl.text = "degrees Fahrenheit"
        thirdLbl.text = "is really"
        fourthLbl.text = "100"
        fifthLbl.text = "degrees Celsius"
        firstLbl.textColor = .orange
        secondLbl.textColor = .orange
        fifthLbl.textColor = .orange
        fourthLbl.textColor = .orange
        firstLbl.font = UIFont.systemFont(ofSize: 70)
        fourthLbl.font = UIFont.systemFont(ofSize: 70)
        secondLbl.font = UIFont.systemFont(ofSize: 36)
        thirdLbl.font = UIFont.systemFont(ofSize: 36)
        fifthLbl.font = UIFont.systemFont(ofSize: 36)
        firstLbl.translatesAutoresizingMaskIntoConstraints = false
        secondLbl.translatesAutoresizingMaskIntoConstraints = false
        thirdLbl.translatesAutoresizingMaskIntoConstraints = false
        fourthLbl.translatesAutoresizingMaskIntoConstraints = false
        fifthLbl.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(firstLbl)
        view.addSubview(secondLbl)
        view.addSubview(thirdLbl)
        view.addSubview(fourthLbl)
        view.addSubview(fifthLbl)
        
        let firstLblTopConstraint = firstLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let secondLblTopConstraint = secondLbl.topAnchor.constraint(equalTo: firstLbl.bottomAnchor, constant: 8)
        let thirdLblTopConstraint = thirdLbl.topAnchor.constraint(equalTo: secondLbl.bottomAnchor, constant: 8)
        let fourthLblTopConstraint = fourthLbl.topAnchor.constraint(equalTo: thirdLbl.bottomAnchor, constant: 8)
        let fifthLblTopConstraint = fifthLbl.topAnchor.constraint(equalTo: fourthLbl.bottomAnchor, constant: 8)
        
        let centerFirstConstraint = firstLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let centerSecondConstraint = secondLbl.centerXAnchor.constraint(equalTo: firstLbl.centerXAnchor)
        let centerThirdConstraint = thirdLbl.centerXAnchor.constraint(equalTo: firstLbl.centerXAnchor)
        let centerFourthConstraint = fourthLbl.centerXAnchor.constraint(equalTo: firstLbl.centerXAnchor)
        let centerFifthConstraint = fifthLbl.centerXAnchor.constraint(equalTo: firstLbl.centerXAnchor)
        
        firstLblTopConstraint.isActive = true
        secondLblTopConstraint.isActive = true
        thirdLblTopConstraint.isActive = true
        fourthLblTopConstraint.isActive = true
        fifthLblTopConstraint.isActive = true
        centerFirstConstraint.isActive = true
        centerSecondConstraint.isActive = true
        centerThirdConstraint.isActive = true
        centerFourthConstraint.isActive = true
        centerFifthConstraint.isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view")
    }
    
}

