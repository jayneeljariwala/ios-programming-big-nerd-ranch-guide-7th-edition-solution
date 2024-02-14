//
//  DateViewController.swift
//  LootLogger
//
//  Created by Jayneel Jariwala on 14/02/24.
//

import UIKit

class DateViewController: UIViewController {
    
    var item: Item!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = item.name
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        item.dateCreated = datePicker.date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datePicker.date = item.dateCreated
        datePicker.maximumDate = Date()
    }

}
