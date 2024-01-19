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
        let newItem = itemStore.createItem()
        if newItem.valueInDollars < 50 {
            if let index = itemStore.allItems[0].firstIndex(of: newItem) {
                let indexPath = IndexPath(row: index, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        } else {
            if let index = itemStore.allItems[1].firstIndex(of: newItem) {
                let indexPath = IndexPath(row: index, section: 1)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
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
        return itemStore.allItems[section].count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let item = itemStore.allItems[indexPath.section][indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.valueInDollars)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "< $50"
        case 1: return ">= $50"
        default: return "Can't Say"
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.section][indexPath.row]
            itemStore.removeItem(item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if sourceIndexPath.section != proposedDestinationIndexPath.section {
            return sourceIndexPath
        } else {
            return proposedDestinationIndexPath
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
       itemStore.moveItem(fromSection: sourceIndexPath.section, toSection: destinationIndexPath.section, fromRow: sourceIndexPath.row, toRow: destinationIndexPath.row)
    }
}
