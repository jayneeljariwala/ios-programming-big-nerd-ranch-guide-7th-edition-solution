//
//  ViewController.swift
//  Photorama
//
//  Created by Jayneel Jariwala on 04/03/24.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet private var imageView: UIImageView!
    var store: PhotoStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        store.fetchInterestingPhotos { photoResult in
            switch photoResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")
                if let firstPhoto = photos.first {
                    self.updateImageView(for: firstPhoto)
                }
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
            }
        }
    }

    func updateImageView(for photo: Photo) {
        store.fetchImage(for: photo) { imageResult in
            switch imageResult {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error downloading image: \(error)")
            }
        }
    }

}

