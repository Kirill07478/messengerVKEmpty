//
//  FriendCell.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 06.07.2021.
//

import UIKit
import SDWebImage

class FriendCell: UITableViewCell {

    static let reuseId = "FriendCell"
    
    @IBOutlet weak var avatarView: AvatarView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configureCell(friend: User){
        nameLabel?.text = friend.fullName()
        
        avatarView.imageView.sd_setImage(with: URL(string: friend.photo100!), placeholderImage: UIImage())
    }
    
}
