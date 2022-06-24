//
//  PersonnelDetailContract.swift
//  HogwartsPersonnel
//
//  Created by Prabhdeep Singh on 22/06/22.
//
import UIKit
 
//MARK: Presenter InPut
protocol DetailViewToPresenterProtocol: AnyObject {
    var interactor: DetailPresenterToInteractorProtocol? { get set }
    var detailView: DetailPresenterToViewProtocol? { get set }
    func viewDidLoad()
}

//MARK: View Input / Presenter Output
protocol DetailPresenterToViewProtocol: AnyObject {
    var presenter: DetailViewToPresenterProtocol? { get set }
    func imageFetchSuccess(image: UIImage?)
    func imageFetchFailure()
}

//MARK: Interactor Input
protocol DetailPresenterToInteractorProtocol: AnyObject {
    var presenter: DetailInteractorToPresenterProtocol? { get set }
    func fetchCharacterImage(imageUrl: String)
}

//MARK: Interactor Output
protocol DetailInteractorToPresenterProtocol: AnyObject {
    func imageRetrievalSuccess(imageData: Data)
    func imageRetrievalFailure()
}

protocol DetailRouterProtocol: AnyObject {
    func createModule(imageURL: String) -> UIViewController
}
