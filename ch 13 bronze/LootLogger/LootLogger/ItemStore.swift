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
        do{
            let data = try Data(contentsOf: itemArchieveURL)
            let unarchiever = PropertyListDecoder()
            let items = try unarchiever.decode([Item].self, from: data)
            allItems = items
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
    
    @objc func saveChanges() throws {
        print("Saving items to: \(itemArchieveURL)")
        do{
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(allItems)
            try data.write(to: itemArchieveURL, options: [.atomic])
            print("Saved all items")
        } catch let encodingError {
            print("Error encoding allItems: \(encodingError)")
            throw ItemSavingError.savingError("\(encodingError)")
        }
        
    }
}
