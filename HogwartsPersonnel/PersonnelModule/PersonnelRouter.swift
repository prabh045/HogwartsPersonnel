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
        vc.navigationItem.title = "Hogwarts Personnel"
        let presenter: ViewToPresenterPersonnelDelegate & InteractorToPresenterDelegate = PersonnelPresenter()
        presenter.interactor = PersonnelInteractor(service: HogwartsPersonnelService())
        presenter.interactor?.presenter = presenter
        presenter.router = self
        presenter.personnelView = vc
        vc.presenter = presenter
        return navVc
    }
    func openDetailVc(on vc: PresenterToViewPersonnelDelegate, imageUrl: String) {
        let personnelVc = vc as? PersonnelViewController
        let detailVc = PersonnelDetailRouter().createModule(imageURL: imageUrl)
        personnelVc?.navigationController?.pushViewController(detailVc, animated: true)
    }
}
