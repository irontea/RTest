//
//  NetworkService.swift
//  ResoTest
//
//  Created by Артур Цыганов on 22.01.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getOffices(comletion: @escaping (Result<[Office]?, Error>) -> ())
}
class NetworkService: NetworkServiceProtocol {
    func getOffices(comletion: @escaping (Result<[Office]?, Error>) -> ()) {
        let urlString = "https://mobile.reso.ru/free/v2/agencies/77"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                comletion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([Office].self, from: data!)
                comletion(.success(obj))
            } catch {
                comletion(.failure(error))
            }
        }.resume()
    }
    
    
}
