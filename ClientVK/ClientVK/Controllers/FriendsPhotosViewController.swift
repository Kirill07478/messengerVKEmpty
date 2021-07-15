//
//  FriendsPhotosViewController.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 01.07.2021.
//

import UIKit

class FriendsPhotosViewController: UICollectionViewController {

    let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "PhotoCell", bundle: nil),
                                forCellWithReuseIdentifier: PhotoCell.reuseId)
        
        
        
        title = name
        print(friendsId)
        
        let group = DispatchGroup()
        
        group.enter()

        apiService.getPhotos(personsId: String(friendsId)) { [weak self] photos in
            
            print("getPhotos")
            
            guard let self = self else { return }
            self.photos = photos
            
            group.leave()
            
        }
        
        group.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
        
    }
    
    //MARK: - DataSource
    
    private let reuseIdentifier = "Cell"
    var name: String = ""
    var friendsId: Int = 0
    var photos: [Photo] = []
    
    //MARK: - Collection View
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        cell.configureCell(photo: photos[indexPath.row])
        
        return cell
    }

}
