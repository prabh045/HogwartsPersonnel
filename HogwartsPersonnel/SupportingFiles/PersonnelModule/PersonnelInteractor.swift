//
//  PersonnelInteractor.swift
//  HogwartsPersonnel
//
//  Created by Prabhdeep Singh on 20/06/22.
//

import Foundation

class PersonnelInteractor: PresenterToInteractorPersonnelDelegate {
    weak var presenter: InteractorToPresenterDelegate?
    var service: HogwartsPersonnelRepo?
    init(service: HogwartsPersonnelRepo?) {
        self.service = service
    }
    func fetchHogwartsPersonnel() {
        print("Fetch hogwarts rans")
        service?.fetchHogwartsPersonnel(completion: { [weak self](result) in
            switch result {
            case .success(let personnel):
                print("personnel is \(personnel)")
                self?.presenter?.personnelFetchSuccess(model: personnel)
            case .failure(let error):
                print("Error is \(error.localizedDescription)")
                self?.presenter?.personnelFetchFailure()
            }
        })
    }
}
