//
//  PersonnelRouter.swift
//  HogwartsPersonnel
//
//  Created by Prabhdeep Singh on 20/06/22.
//

import UIKit

class PersonnelRouter: PresenterToRouterPersonnelDelegate {    
     func startModule() -> UINavigationController {
        let vc = PersonnelViewController()
        let navVc = UINavigationController(rootViewController: vc)
        let presenter: ViewToPresenterPersonnelDelegate & InteractorToPresenterDelegate = PersonnelPresenter()
        presenter.interactor = PersonnelInteractor(service: HogwartsPersonnelService())
        presenter.interactor?.presenter = presenter
        presenter.router = PersonnelRouter()
        presenter.personnelView = vc
        vc.presenter = presenter
        return navVc
    }
}
