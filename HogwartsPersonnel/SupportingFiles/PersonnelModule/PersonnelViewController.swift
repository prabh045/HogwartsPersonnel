//
//  ViewController.swift
//  HogwartsPersonnel
//
//  Created by Prabhdeep Singh on 20/06/22.
//

import UIKit

class PersonnelViewController: UIViewController {
    var presenter: ViewToPresenterPersonnelDelegate?
    lazy var personnelTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        presenter?.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(personnelTableView)
        NSLayoutConstraint.activate([
            personnelTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            personnelTableView.topAnchor.constraint(equalTo: view.topAnchor),
            personnelTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            personnelTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
//MARK: Extension PresenterToViewPersonnelDelegate
extension PersonnelViewController: PresenterToViewPersonnelDelegate {
    func updateUiWithPersonnelSuccess(model: [PersonnelModel]) {
        print("update ui with success")
        DispatchQueue.main.async {
            self.personnelTableView.reloadData()
        }
    }
    
    func updateUiWithPersonnelFailure(error: String) {
        print("update ui with failure \(error)")
    }
}

//MARK: Extension Tableview datasource and delegate
extension PersonnelViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = presenter as? PersonnelPresenter else {
            return 0
        }
        return presenter.personnelCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let presenter = presenter as? PersonnelPresenter else {
            return cell
        }
        cell.textLabel?.text = presenter.personnel(at: indexPath.row)
        return cell
    }
}

