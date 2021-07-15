//
//  SettingsViewController.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 28.06.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let session = Session.shared
        nameLabel.text = session.name
        idLabel.text = String(describing: session.userID)
        tokenLabel.text = session.token
        
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var tokenLabel: UILabel!
    
    
    
}
