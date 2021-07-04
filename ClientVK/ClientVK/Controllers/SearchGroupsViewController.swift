//
//  SearchGroupsViewController.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 01.07.2021.
//

import UIKit

class SearchGroupsViewController: UITableViewController {

    let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apiService.searchGroups(searchBar: "someString") { photos in
            
            print("searchGroups")
        }
        
    }

}
