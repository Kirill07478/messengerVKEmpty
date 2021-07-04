//
//  Session.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 24.06.2021.
//

import Foundation

final class Session {
    
    static let shared = Session()
    
    private init(){}
    
    var name = ""
    var userID = ""
    var token = ""
    
}
