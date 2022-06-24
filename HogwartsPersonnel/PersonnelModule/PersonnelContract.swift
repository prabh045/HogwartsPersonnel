//
//  PersonnelContract.swift
//  HogwartsPersonnel
//
//  Created by Prabhdeep Singh on 20/06/22.
//
import UIKit

//MARK: View Contract
//View -> Presenter (Presenter input)
protocol ViewToPresenterPersonnelDelegate: AnyObject {
    var personnelView: PresenterToViewPersonnelDelegate? { get set }
    var interactor: PresenterToInteractorPersonnelDelegate? { get set }
    var router: PresenterToRouterPersonnelDelegate? { get set }
    func viewDidLoad()
    func didSelectRow(at index: Int)
}

//MARK: Presenter Contracts
//Presenter -> View (Presenter output to view)
protocol PresenterToViewPersonnelDelegate: AnyObject {
    func updateUiWithPersonnelSuccess(model: [PersonnelModel])
    func updateUiWithPersonnelFailure(error: String)
}
//Presenter -> Interactor (Presenter output to interactor)
protocol PresenterToInteractorPersonnelDelegate: AnyObject {
    var presenter: InteractorToPresenterDelegate? { get set }
    func fetchHogwartsPersonnel()
}
//Presenter -> Router (Presenter output to router)
protocol PresenterToRouterPersonnelDelegate: AnyObject {
    func startModule() -> UINavigationController
    func openDetailVc(on vc: PresenterToViewPersonnelDelegate, imageUrl: String)
}

//MARK: Interactor Contracts
//Interactor -> Presenter (Interactor output to presenter)
protocol InteractorToPresenterDelegate: AnyObject {
    func personnelFetchSuccess(model: [PersonnelModel])
    func personnelFetchFailure()
}


