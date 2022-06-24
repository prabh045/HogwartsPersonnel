//
//  HogwartsPersonnelRepo.swift
//  HogwartsPersonnel
//
//  Created by Prabhdeep Singh on 20/06/22.
//

import Foundation

protocol HogwartsPersonnelRepo {
    func fetchHogwartsPersonnel(completion: @escaping (Result<[PersonnelModel], APIError>) -> Void)
}
