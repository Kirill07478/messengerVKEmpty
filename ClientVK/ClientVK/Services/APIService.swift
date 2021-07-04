//
//  APIService.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 01.07.2021.
//

import Foundation
import Alamofire

struct User {
    
}

struct Photo {
    
}

final class APIService {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userID
    let version = "5.21"
    
    
    // Получение списка друзей
    func getFriends(completion: ([User])->()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "order": "name",
            "count": 20,
            "fields": "photo_100",
            "access_token": token,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            guard let data = response.value else { return }
            
            print(data.prettyJSON)
            
            
        }
        
        completion([])
        
    }
    
    //Получение фотографий человека
    func getPhotos(personsId: String, completion: ([Photo])->()) {
        
        let method = "/photos.getAll"
        
        let parameters: Parameters = [
            "owner_id": personsId,
            "extended": 1,
            "no_service_albums": 1,
            "count": 20,
            "access_token": token,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            guard let data = response.value else { return }
            
            print(data.prettyJSON)
            
            
        }
        
        completion([])
        
    }
    
    
    //Получение групп текущего пользователя
    
    func getGroups (personsId: String, completion: ([Photo])->()) {
        
        let method = "/groups.get"
        
        let parameters: Parameters = [
            "user_id": personsId,
            "extended": 0,
            "access_token": token,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            guard let data = response.value else { return }
            
            print(data.prettyJSON)
            
            
        }
        
        completion([])
        
    }
    
    
    //Получение групп по поисковому запросу
    
    func searchGroups (searchBar: String, completion: ([Photo])->()) {
        
        let method = "/groups.search"
        
        let parameters: Parameters = [
            "q": searchBar,
            "access_token": token,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            guard let data = response.value else { return }
            
            print(data.prettyJSON)
            
            
        }
        
        completion([])
        
    }
    
}
