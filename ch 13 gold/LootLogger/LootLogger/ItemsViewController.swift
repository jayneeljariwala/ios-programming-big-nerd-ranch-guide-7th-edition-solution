//
//  ItemsViewController.swift
//  LootLogger
//
//  Created by Jayneel Jariwala on 11/01/24.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    let notification = Notification(name: Notification.Name("updateItem"))
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        navigationItem.leftBarButtonItem = editButtonItem
        NotificationCenter.default.addObserver(self, selector: #selector(updateTable(_:)), name: Notification.Name("updateItem"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(notification)
        tableView.reloadData()
    }
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        let newItem = itemStore.createItem()
        if let index = ItemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
            NotificationCenter.default.post(notification)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        let item = ItemStore.allItems[indexPath.row]
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "$\(item.valueInDollars)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = ItemStore.allItems[indexPath.row]
            itemStore.removeItem(item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            NotificationCenter.default.post(notification)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        NotificationCenter.default.post(notification)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showItem":
            if let row = tableView.indexPathForSelectedRow?.row {
                let item = ItemStore.allItems[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    @objc func updateTable(_ notification: Notification) {
        tableView.reloadData()
    }
}
