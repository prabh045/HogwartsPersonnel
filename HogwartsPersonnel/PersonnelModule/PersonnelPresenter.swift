//
//  PersonnelPresenter.swift
//  HogwartsPersonnel
//
//  Created by Prabhdeep Singh on 20/06/22.
//

import Foundation

class PersonnelPresenter: ViewToPresenterPersonnelDelegate {
    //MARK: Protocol confirmance
    weak var personnelView: PresenterToViewPersonnelDelegate?
    var interactor: PresenterToInteractorPersonnelDelegate?
    var router: PresenterToRouterPersonnelDelegate?
    func viewDidLoad() {
        interactor?.fetchHogwartsPersonnel()
    }
    func didSelectRow(at index: Int) {
        guard let personnelView = personnelView else {
            return
        }
        let imageUrl = personnel[index].image
        router?.openDetailVc(on: personnelView, imageUrl: imageUrl)
    }
    //MARK: Properties
    private var personnel = [PersonnelModel]()
    func personnel(at index: Int) -> String {
        return personnel[index].name
    }
    func personnelCount() -> Int{
        return personnel.count
    }
}
//MARK: Extension
extension PersonnelPresenter: InteractorToPresenterDelegate {
    func personnelFetchSuccess(model: [PersonnelModel]) {
        print("Personnel fetch sucess \(model)")
        personnel = model
        personnelView?.updateUiWithPersonnelSuccess(model: model)
    }
    func personnelFetchFailure() {
        print("Personnel fetch failure")
        personnelView?.updateUiWithPersonnelFailure(error: "Some error")
    }
}
