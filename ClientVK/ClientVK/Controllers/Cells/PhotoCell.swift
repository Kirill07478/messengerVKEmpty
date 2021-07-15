//
//  PhotoCell.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 07.07.2021.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    static let reuseId = "PhotoCell"
    
    @IBOutlet weak var photoImage: UIImageView!
    
    func configureCell(photo: Photo){
        
        photoImage.sd_setImage(with: URL(string: photo.photo604), placeholderImage: UIImage())
        
    }
    
}
