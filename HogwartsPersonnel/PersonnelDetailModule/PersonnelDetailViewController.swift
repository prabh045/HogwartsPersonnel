//
//  PersonnelDetailViewController.swift
//  HogwartsPersonnel
//
//  Created by Prabhdeep Singh on 22/06/22.
//

import UIKit

class PersonnelDetailViewController: UIViewController {
    var presenter: DetailViewToPresenterProtocol?
    lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(characterImageView)
        NSLayoutConstraint.activate([
            characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.50),
            characterImageView.heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.50),
        ])
    }
}

//MARK: Extension DetailPresenterToViewProtocol
extension PersonnelDetailViewController: DetailPresenterToViewProtocol {
    func imageFetchSuccess(image: UIImage?) {
        guard let image = image else {
            print("Corrupted image")
            return
        }
        DispatchQueue.main.async {
            self.characterImageView.image = image
        }
    }
    func imageFetchFailure() {
        //handle erroe here
    }
}
