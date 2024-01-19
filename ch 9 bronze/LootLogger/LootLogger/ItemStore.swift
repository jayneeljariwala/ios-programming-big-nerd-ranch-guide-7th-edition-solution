//
//  ItemStore.swift
//  LootLogger
//
//  Created by Jayneel Jariwala on 12/01/24.
//

import UIKit

class ItemStore {
    var allItems = [[Item](), [Item]()]
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        if newItem.valueInDollars < 50 {
            allItems[0].append(newItem)
        } else {
            allItems[1].append(newItem)
        }
        return newItem
    }
    
    func removeItem(_ item: Item) {
        if item.valueInDollars < 50 {
            let itemArrayToSearch = allItems[0]
            if let removeIndex = itemArrayToSearch.firstIndex(of: item) {
                allItems[0].remove(at: removeIndex)
            } else {
                return
            }
        } else {
            let itemArrayToSearch = allItems[1]
            if let removeIndex = itemArrayToSearch.firstIndex(of: item) {
                allItems[1].remove(at: removeIndex)
            } else {
                return
            }
        }
    }
    
    func moveItem(fromSection: Int, toSection: Int, fromRow fromIndex: Int, toRow toIndex: Int) {
        let itemToMove = allItems[fromSection][fromIndex]
        allItems[fromSection].remove(at: fromIndex)
        allItems[fromSection].insert(itemToMove, at: toIndex)
    }
}
