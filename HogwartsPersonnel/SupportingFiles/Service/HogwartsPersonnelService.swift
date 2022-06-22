//
//  HogwartsPersonnelService.swift
//  HogwartsPersonnel
//
//  Created by Prabhdeep Singh on 20/06/22.
//

import Foundation

enum APIError: Error {
    case genericError
    case invalidURL
    case noData
    case invalidResponse
    case wrongStatusCode
    case invalidRequest
}

class HogwartsPersonnelService: HogwartsPersonnelRepo {
    func fetchHogwartsPersonnel(completion: @escaping (Result<[PersonnelModel], APIError>) -> Void) {
        print("api code ran")
        guard let url = URL(string: "http://hp-api.herokuapp.com/api/characters") else {
            completion(Result.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.genericError))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            guard response.statusCode == 200 else {
                completion(.failure(.wrongStatusCode))
                return
            }
            do {
                let modelArray = try JSONDecoder().decode([PersonnelModel].self, from: data)
                print("converted model is \(modelArray)")
                completion(.success(modelArray))
            } catch (let error) {
                completion(.failure(.genericError))
                print("Error in converting Model \(error.localizedDescription)")
            }
        }.resume()
    }
}
