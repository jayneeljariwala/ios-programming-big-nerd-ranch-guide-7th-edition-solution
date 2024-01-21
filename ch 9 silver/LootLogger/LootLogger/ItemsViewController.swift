//
//  ItemsViewController.swift
//  LootLogger
//
//  Created by Jayneel Jariwala on 11/01/24.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(_ sender: UIButton) {
        if itemStore.allItems[0].name == "No items!" {
            itemStore.removeItem(itemStore.allItems[0])
            tableView.deleteRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        }
        let newItem = itemStore.createItem()
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        if self.isEditing {
            sender.setTitle("Edit", for: .normal)
            self.setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
            self.setEditing(true, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if itemStore.allItems[0].name == "No items!" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyItemCell", for: indexPath)
            cell.textLabel?.text = itemStore.allItems[indexPath.row].name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            let item = itemStore.allItems[indexPath.row]
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "\(item.valueInDollars)"
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            itemStore.removeItem(item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            if itemStore.allItems.isEmpty {
                itemStore.createNoItems()
                tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}
