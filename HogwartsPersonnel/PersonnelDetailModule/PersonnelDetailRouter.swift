//
//  PersonalDetailRouter.swift
//  HogwartsPersonnel
//
//  Created by Prabhdeep Singh on 23/06/22.
//

import UIKit

class PersonnelDetailRouter: DetailRouterProtocol {
    func createModule(imageURL: String) -> UIViewController {
        let detailVc = PersonnelDetailViewController()
        let presenter = DetailPresenter(imageUrl: imageURL)
        detailVc.presenter = presenter
        detailVc.presenter?.detailView = detailVc
        detailVc.presenter?.interactor = DetailInteractor()
        detailVc.presenter?.interactor?.presenter = presenter
        return detailVc
    }
}
