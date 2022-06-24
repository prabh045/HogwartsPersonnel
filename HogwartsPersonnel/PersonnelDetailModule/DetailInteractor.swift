//
//  DetailInteractor.swift
//  HogwartsPersonnel
//
//  Created by Prabhdeep Singh on 22/06/22.
//

import Foundation

class DetailInteractor: DetailPresenterToInteractorProtocol {
    weak var presenter: DetailInteractorToPresenterProtocol?
    func fetchCharacterImage(imageUrl: String) {
        ImageService().fetchImageData(url: imageUrl) { (result) in
            switch result {
            case .success(let imageData):
                print("got the character image")
                self.presenter?.imageRetrievalSuccess(imageData: imageData)
            case .failure(let error):
                print("error in image \(error)")
                self.presenter?.imageRetrievalFailure()
            }
        }
    }
}
