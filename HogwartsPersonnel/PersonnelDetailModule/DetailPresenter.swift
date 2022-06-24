//
//  DetailPresenter.swift
//  HogwartsPersonnel
//
//  Created by Prabhdeep Singh on 22/06/22.
//

import Foundation

class DetailPresenter: DetailViewToPresenterProtocol {
    var interactor: DetailPresenterToInteractorProtocol?
    weak var detailView: DetailPresenterToViewProtocol?
    var imageUrl: String
    init(imageUrl: String) {
        self.imageUrl = imageUrl
    }
    func viewDidLoad() {
        interactor?.fetchCharacterImage(imageUrl: imageUrl)
    }
}

extension DetailPresenter: DetailInteractorToPresenterProtocol {
    func imageRetrievalSuccess(imageData: Data) {
        detailView?.imageFetchSuccess(image: ImageService().getImage(from: imageData))
    }
    
    func imageRetrievalFailure() {
        detailView?.imageFetchFailure()
    }
}
