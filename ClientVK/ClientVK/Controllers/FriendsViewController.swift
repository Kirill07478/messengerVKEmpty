//
//  FriendsViewController.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 01.07.2021.
//

import UIKit

class FriendsViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "FriendCell", bundle: nil),
                           forCellReuseIdentifier: FriendCell.reuseId)
        
        let group = DispatchGroup()
        
        group.enter()
        
        apiService.getFriends { [weak self] users in
        
            guard let self = self else { return }
            self.friends = users
            
            group.leave()
            
        }
        
        group.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.setupDataSource()
            self.tableView.reloadData()
        }
        
    }
    
    // MARK: - DataSource
    
    var friends: [User] = []
    var filteredFriends: [User] = []
    var sections: [String] = []
    var cashedSectionItems: [String:[User]] = [:]
    
    private func filterFriends (text: String?) {
        guard let text = text, !text.isEmpty else {
            filteredFriends = friends
            return
        }
        
        filteredFriends = friends.filter {
            $0.fullName().lowercased().contains(text.lowercased())
        }
    }
    
    private func setupDataSource() {
        
        filterFriends(text: searchBar.text)
        
        let firstLetter = filteredFriends.map {String($0.lastName!.uppercased().prefix(1))}
        sections = Array(Set(firstLetter)).sorted()
        
        cashedSectionItems = [:]
        for section in sections {
            cashedSectionItems[section] = filteredFriends.filter {
                $0.lastName!.uppercased().prefix(1) == section
                
            }
        }
    }
    
    private func getFriend (for indexPath: IndexPath) -> User {
        let sectionLetter = sections[indexPath.section]
        return cashedSectionItems[sectionLetter]![indexPath.row]
    }
    
    // MARK: - Table view
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionLetter = sections[section]
        return (cashedSectionItems[sectionLetter] ?? []).count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friend = getFriend(for: indexPath)

        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell

        cell.configureCell(friend: friend)

        return cell
    }
    
    // MARK: - Segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? FriendsPhotosViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let friend = getFriend(for: indexPath)
            controller.name = friend.fullName()
            controller.friendsId = friend.id

        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SegueToFriendsPhotos", sender: tableView.cellForRow(at: indexPath))
    }
    
    // MARK: - Search Bar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.setupDataSource()
        self.tableView.reloadData()
    }

}
