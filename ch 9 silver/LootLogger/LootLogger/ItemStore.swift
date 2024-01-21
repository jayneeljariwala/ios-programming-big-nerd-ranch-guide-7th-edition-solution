//
//  ItemStore.swift
//  LootLogger
//
//  Created by Jayneel Jariwala on 12/01/24.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    init() {
        allItems.append(Item(name: "No items!", serialNumber: nil, valueInDollars: 0))
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    @discardableResult func createNoItems() -> Item {
        let newItem = Item(name: "No items!", serialNumber: nil, valueInDollars: 0)
        allItems.append(newItem)
        return newItem
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedItem = allItems[fromIndex]
        
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
    }
}
