//
//  ItemsViewController.swift
//  LootLogger
//
//  Created by Jayneel Jariwala on 11/01/24.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var addBtn: UIButton!
    
    
    @IBAction func addNewItem(_ sender: UIButton) {
        let newItem = itemStore.createItem()
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleFavorite(_ sender: UISegmentedControl) {
        tableView.reloadData()
        if sender.selectedSegmentIndex == 1 {
            addBtn.isEnabled = false
            addBtn.setTitleColor(.gray, for: .disabled)
        } else {
            addBtn.isEnabled = true
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if segmentedControl.selectedSegmentIndex == 1 {
            if itemStore.allItems[indexPath.row].isFavorite {
                return 45
            } else {
                return 0
            }
        } else {
            return 45
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let item = itemStore.allItems[indexPath.row]
        if item.isFavorite {
            cell.textLabel?.text = "\(item.name) ⭐️"
        } else {
            cell.textLabel?.text = "\(item.name)"
        }
        
        cell.detailTextLabel?.text = "\(item.valueInDollars)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            itemStore.removeItem(item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextualAction: UIContextualAction!
        if itemStore.allItems[indexPath.row].isFavorite {
            contextualAction = UIContextualAction(style: .normal, title: "Remove from favorite", handler: { [unowned self] contextualAction, uiView, success in
                self.itemStore.removeFromFavorite(at: indexPath.row)
                tableView.reloadRows(at: [indexPath], with: .automatic)
                success(true)
            })
            contextualAction.backgroundColor = .red
        } else {
            contextualAction = UIContextualAction(style: .normal, title: "Add to favorite", handler: { [unowned self] contextualAction, uiView, success in
                self.itemStore.addToFavorite(at: indexPath.row)
                tableView.reloadRows(at: [indexPath], with: .automatic)
                success(true)
            })
            contextualAction.backgroundColor = .green
        }
        let swipeAction = UISwipeActionsConfiguration(actions: [contextualAction])
        return swipeAction
    }
}
