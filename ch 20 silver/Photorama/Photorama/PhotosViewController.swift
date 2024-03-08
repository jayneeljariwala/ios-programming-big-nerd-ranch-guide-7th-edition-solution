//
//  ViewController.swift
//  Photorama
//
//  Created by Jayneel Jariwala on 04/03/24.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet private var imageView: UIImageView!
    
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            fetchFromServer(endPoint: FlickrAPI.interestingPhotosURL)
        } else {
            fetchFromServer(endPoint: FlickrAPI.recentPhotosURL)
        }
    }
    
    var store: PhotoStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchFromServer(endPoint: FlickrAPI.interestingPhotosURL)
    }
    
    func fetchFromServer(endPoint: URL) {
        store.fetchInterestingPhotos(endPoint: endPoint) { photoResult in
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

