//
//  FriendsPhotosViewController.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 01.07.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class FriendsPhotosViewController: UICollectionViewController {

    let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apiService.getPhotos(personsId: Session.shared.userID) { photos in
            
            print("getPhotos")
            
        }
        
    }

}
