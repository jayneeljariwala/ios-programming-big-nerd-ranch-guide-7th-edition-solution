//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Jayneel Jariwala on 11/03/24.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    
    var store: PhotoStore!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        store.fetchImage(for: photo) { result in
            switch result {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error fetching image for photo: \(error)")
            }
        }
    }
    
}
