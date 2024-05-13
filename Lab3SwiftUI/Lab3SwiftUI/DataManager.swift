//
//  DataManager.swift
//  Lab3SwiftUI
//
//  Created by Juan jose Morales on 13/5/24.
//

import Foundation
import Alamofire

class DataManager{
    
    static let shared = DataManager()
    
    private init(){}
    
    func fetchCharacters(completion: @escaping ([Character]?, Error?)-> Void){
        AF.request("https://rickandmortyapi.com/api/character")
            .validate()
            .responseDecodable(of: CharactersResponse.self){ response in
                switch response.result{
                case .success(let charactersResponse):
                    completion(charactersResponse.results, nil)
                case .failure(let error):
                    completion(nil,error)
                }
                
            }
    }
}
