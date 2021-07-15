//
//  SearchGroupsViewController.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 01.07.2021.
//

import UIKit

class SearchGroupsViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "GroupCell", bundle: nil),
                           forCellReuseIdentifier: GroupCell.reuseId)
        
    }
    
    var groups: [Group] = []
    
    // MARK: - Table view
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupCell

        cell.configureCell(group: groups[indexPath.row])

        return cell
    }
    
    // MARK: - Functions
    
    func searchGroups(searchText: String) {
        
        let group = DispatchGroup()
        
        group.enter()
        
        apiService.searchGroups(searchBar: searchText) { [weak self] groups in
            
            guard let self = self else { return }
            self.groups = groups
            print("getGroups")
            
            group.leave()
        }
        
        group.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Search Bar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchGroups(searchText: searchText)
    }

}
