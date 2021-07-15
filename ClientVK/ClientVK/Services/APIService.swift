//
//  APIService.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 01.07.2021.
//

import Foundation
import Alamofire

final class APIService {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userID
    let version = "5.21"
    
    
    // Получение списка друзей
    func getFriends(completion: @escaping ([User])->()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "order": "name",
            "count": 5000,
            "fields": "photo_100",
            "access_token": token,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            guard let data = response.value else { return }
            
//            print(data.prettyJSON)
            
            // MARK: - Manual parsing
//            guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else { return }
//
//            let object = json as! [String: Any]
//            let response = object["response"] as! [String:Any]
//            let items = response["items"] as! [Any]
//
//            for userJson in items {
//
//                let userJson = userJson as! [String: Any]
//                let id = userJson["id"] as! Int
//                let lastName = userJson["last_name"] as! String
//                let firstName = userJson["first_name"] as! String
//
//                print(id, firstName, lastName)
            
            // MARK: - Parse with using QuickType and JSONDecoder
            let friendsResponse = try? JSONDecoder().decode(Friends.self, from: data)
            
            guard let friends = friendsResponse?.response.items else { return }
                
            DispatchQueue.main.async {
                completion(friends)
            }
            
        }
    }
    
    //Получение фотографий человека
    func getPhotos(personsId: String, completion: @escaping ([Photo])->()) {
        
        let method = "/photos.getAll"
        
        let parameters: Parameters = [
            "owner_id": personsId,
            "extended": 1,
            "no_service_albums": 0,
            "count": 20,
            "access_token": token,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            guard let data = response.value else { return }
            
//            print(data.prettyJSON)
            
            // MARK: - Parse with using QuickType and JSONDecoder
            let photosResponse = try? JSONDecoder().decode(Photos.self, from: data)
            
            guard let photos = photosResponse?.response.items else { return }
                
            DispatchQueue.main.async {
                completion(photos)
            }
            
            
        }
    }
    
    
    //Получение групп текущего пользователя
    
    func getGroups (personsId: String, completion: @escaping ([Group])->()) {
        
        let method = "/groups.get"
        
        let parameters: Parameters = [
            "user_id": personsId,
            "extended": 1,
            "access_token": token,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            guard let data = response.value else { return }
            
//            print(data.prettyJSON)
            
            // MARK: - Parse with using QuickType and JSONDecoder
            let groupsResponse = try? JSONDecoder().decode(Groups.self, from: data)
            
            guard let groups = groupsResponse?.response.items else { return }
                
            DispatchQueue.main.async {
                completion(groups)
            }
            
        }
    }
    
    
    //Получение групп по поисковому запросу
    
    func searchGroups (searchBar: String, completion: @escaping ([Group])->()) {
        
        let method = "/groups.search"
        
        let parameters: Parameters = [
            "q": searchBar,
            "access_token": token,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            
            guard let data = response.value else { return }
            
//            print(data.prettyJSON)
            
            // MARK: - Parse with using QuickType and JSONDecoder
            let groupsResponse = try? JSONDecoder().decode(Groups.self, from: data)
            
            guard let groups = groupsResponse?.response.items else { return }
                
            DispatchQueue.main.async {
                completion(groups)
            }
            
            
        }
    }
    
}
