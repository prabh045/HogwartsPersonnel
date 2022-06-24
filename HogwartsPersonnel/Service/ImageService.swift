//
//  ImageService.swift
//  HogwartsPersonnel
//
//  Created by Prabhdeep Singh on 22/06/22.
//

import UIKit

class ImageService {
    func fetchImageData(url: String, completion: @escaping (Result<Data, APIError>) -> Void) {
        guard let url = URL(string: url) else {
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
            completion(.success(data))
        }.resume()
    }
    
    func getImage(from data: Data) -> UIImage? {
        return UIImage(data: data)
    }
}
