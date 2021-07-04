//
//  FriendsViewController.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 01.07.2021.
//

import UIKit

class FriendsViewController: UITableViewController {

    let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apiService.getFriends { users in
            
            print("getFriends")
            
        }
        
    }

}
