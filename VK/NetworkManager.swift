//
//  NetworkManager.swift
//  VK
//
//  Created by пользовтель on 20.04.2021.
//

import Foundation
import Alamofire

class VKService {
    // базовый URL сервиса
    let baseUrl = "https://api.vk.com"
    // ключ для доступа к сервису
    let apiKey = Session.shared.token

    // метод для загрузки информации о друзьях
    func loadFriendData(extraPath: String, completion: @escaping ([Friend]) -> Void ){
        
        // путь для получения списков друзей или груп
        let path = "/method/" + extraPath
        // параметры, токен, версия
        let methodName: Parameters = [
            "fields": "photo_50",
            "access_token": apiKey,
            "v": "5.130"
        ]
            
        // составляем URL из базового адреса сервиса и конкретного пути к ресурсу
        let url = baseUrl+path
            
        // делаем запрос
        AF.request(url, method: .get, parameters: methodName).responseData { response in
            guard let data = response.value else { return }
                
            let arrayFriends = try! JSONDecoder().decode(FriendResponse.self, from: data)
            
            //записываем в бд Realm
            saveFriendsData(arrayFriends.response.items)
            
            
            completion(arrayFriends.response.items)
 
        }
    }
    
    func loadPhotoData (ownerId: Int, completion: @escaping ([Photo]) -> Void ){
        // путь для получения списков друзей или груп
        let path = "/method/photos.getAll"
        // параметры, токен, версия
        let methodName: Parameters = [
            "extended": 1,
            "owner_id": ownerId,
            "access_token": apiKey,
            "v": "5.130"
        ]
        // составляем URL из базового адреса сервиса и конкретного пути к ресурсу
        let url = baseUrl+path
            
        // делаем запрос
        AF.request(url, method: .get, parameters: methodName).responseData { response in
            guard let data = response.value else { return }
                
            let photoArray = try! JSONDecoder().decode(PhotoResponse.self, from: data)
            savePhotoData(photoArray.response.items)
            completion(photoArray.response.items)
            
        }
    }
    
    func loadGlobalGroup (extraPath: String, completion: @escaping ([Group]) -> Void ){
        
        // путь для получения списков друзей или груп
        let path = "/method/" + extraPath
        // параметры, токен, версия
        let methodName: Parameters = [
            "extended": 1,
            "fields": "photo_50",
            "access_token": apiKey,
            "v": "5.130"
        ]
            
        // составляем URL из базового адреса сервиса и конкретного пути к ресурсу
        let url = baseUrl+path
            
        // делаем запрос
        AF.request(url, method: .get, parameters: methodName).responseData { response in
            guard let data = response.value else { return }
                
            let arrayGroups = try! JSONDecoder().decode(GroupResponse.self, from: data)
            saveGroupData(arrayGroups.response.items)
            completion(arrayGroups.response.items)
 
        }
    }
    
}
