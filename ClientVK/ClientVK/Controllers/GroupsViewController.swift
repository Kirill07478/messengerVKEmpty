//
//  GroupsViewController.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 01.07.2021.
//

import UIKit

class GroupsViewController: UITableViewController {

    let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apiService.getGroups(personsId: Session.shared.userID) { photos in
            
            print("getGroups")
            
        }
        
    }
    
}
