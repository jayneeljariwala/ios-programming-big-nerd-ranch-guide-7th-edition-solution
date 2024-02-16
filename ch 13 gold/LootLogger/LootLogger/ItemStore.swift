//
//  ItemStore.swift
//  LootLogger
//
//  Created by Jayneel Jariwala on 12/01/24.
//

import UIKit

class ItemStore {
    
    static var allItems = [Item]()
    
    init() {
        do{
            let data = try Data(contentsOf: itemArchieveURL)
            let unarchiever = PropertyListDecoder()
            let items = try unarchiever.decode([Item].self, from: data)
            ItemStore.allItems = items
        } catch {
            print("Error reading in saved items: \(error)")
        }
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(saveChanges), name: UIScene.didEnterBackgroundNotification, object: nil)
    }
    
    let itemArchieveURL: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        if #available(iOS 16.0, *) {
            return documentDirectory.appending(path: "items.plist", directoryHint: .notDirectory)
        } else {
            // Fallback on earlier versions
            return documentDirectory.appendingPathComponent("items.plist")
        }
    }()
        
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        ItemStore.allItems.append(newItem)
        return newItem
    }
    
    func removeItem(_ item: Item) {
        if let index = ItemStore.allItems.firstIndex(of: item) {
            ItemStore.allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedItem = ItemStore.allItems[fromIndex]
        
        ItemStore.allItems.remove(at: fromIndex)
        ItemStore.allItems.insert(movedItem, at: toIndex)
    }
    
    @objc func saveChanges() -> Bool {
        print("Saving items to: \(itemArchieveURL)")
        do{
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(ItemStore.allItems)
            try data.write(to: itemArchieveURL, options: [.atomic])
            print("Saved all items")
            return true
        } catch let encodingError {
            print("Error encoding allItems: \(encodingError)")
            return false
        }
        
    }
}
