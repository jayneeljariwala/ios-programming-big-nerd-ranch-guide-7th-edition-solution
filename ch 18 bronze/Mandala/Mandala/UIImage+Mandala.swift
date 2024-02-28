//
//  UIImage+Mandala.swift
//  Mandala
//
//  Created by Jayneel Jariwala on 23/02/24.
//

import UIKit

enum ImageResources: String {
    case angry
    case confused
    case crying
    case goofy
    case happy
    case meh
    case sad
    case sleepy
}

extension UIImage {
    convenience init(resources: ImageResources) {
        self.init(named: resources.rawValue)!
    }
}
