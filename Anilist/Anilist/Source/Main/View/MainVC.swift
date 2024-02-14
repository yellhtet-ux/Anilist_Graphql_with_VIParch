//
//  MainVC.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import UIKit

class MainVC: UIViewController {
    let searchStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return stack
    }()
    
    let searchTextField: UITextField = {
       let tF = UITextField()
        tF.placeholder = "Please Enter Your Keywords"
        tF.borderStyle = .roundedRect
        tF.layer.cornerRadius = 8.0
        tF.layer.borderColor = UIColor.gray.cgColor
        tF.textColor = .lightGray
        tF.translatesAutoresizingMaskIntoConstraints = false
        return tF
    }()
    
    let searchButton: UIButton = {
       let button = UIButton()
        button.setTitle("Search", for: .normal)
        return button
    }()
    
    let errorLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 1
        return label    
    }()
    
    let animeTableView : UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var interactor: MainVCInteracting?
    var router: MainVCRouting? 
    var viewModel: MainVCViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
    }
}

extension MainVC {
    func searchButtonSetUp () {
        searchButton.addTarget(self, action: #selector(didSearchButtonGotPressed), for: .touchUpInside)
    }
    
    @objc func didSearchButtonGotPressed () {
        viewModel.searchTerm = searchTextField.text ?? ""
        interactor?.searchAnime(1, 10, searchTerm: viewModel.searchTerm)
    } 
}

extension MainVC : MainVCControlling {
    
    func render(_ state: State) {
        switch state {
        case .getSearchAnimeData(let animeSearchResultModel,let isInitial):
            reload(animeSearchResultModel.media ?? [], isInitial)
        case .getSearchAnimeError(let errString):
            showError(errString)
        }
    }
    
    func reload (_ data: [Media],_ isInitial: Bool) {
        viewModel.isLoading = true
        viewModel.media.append(contentsOf: data.map{$0})
        self.animeTableView.reloadData()
    }
    
    func showError (_ errStr: String ) {
        let alert = UIAlertController(title: "Alert", message: errStr, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        self.navigationController?.pushViewController(alert, animated: true)
    }
}
