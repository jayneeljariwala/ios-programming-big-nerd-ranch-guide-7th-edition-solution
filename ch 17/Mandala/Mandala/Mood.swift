//
//  Mood.swift
//  Mandala
//
//  Created by Jayneel Jariwala on 23/02/24.
//

import UIKit

struct Mood {
    var name: String
    var image: UIImage
    var color: UIColor
}

extension Mood {
    static let angry = Mood(name: "angry", image: UIImage(resources: ImageResources.angry), color: UIColor.angry)
    
    static let confused = Mood(name: "confused", image: UIImage(resources: ImageResources.confused), color: UIColor.confused)
    
    static let crying = Mood(name: "crying", image: UIImage(resources: ImageResources.crying), color: UIColor.crying)
    
    static let goofy = Mood(name: "goofy", image: UIImage(resources: ImageResources.goofy), color: UIColor.goofy)
    
    static let happy = Mood(name: "happy", image: UIImage(resources: ImageResources.happy), color: UIColor.happy)
    
    static let meh = Mood(name: "meh", image: UIImage(resources: ImageResources.meh), color: UIColor.meh)
    
    static let sad = Mood(name: "sad", image: UIImage(resources: ImageResources.sad), color: UIColor.sad)
    
    static let sleepy = Mood(name: "sleepy", image: UIImage(resources: ImageResources.sleepy), color: UIColor.sleepy)
}
