//
//  GroupCell.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 06.07.2021.
//

import UIKit
import SDWebImage

class GroupCell: UITableViewCell {
 
    static let reuseId = "GroupCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarView: UIImageView!
    
    func configureCell(group: Group){
        nameLabel?.text = group.name
        
        avatarView.sd_setImage(with: URL(string: group.photo100), placeholderImage: UIImage())
    }
    
}
