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
    
    let animeTableView : UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var interactor: MainVCInteracting?
    var router: MainVCRouting? 
    var viewModel: MainVCViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
    }
}

extension MainVC : MainVCControlling {
    func render(_ state: State) {
        switch state {
        case let .getSearchAnimeData(animeData):
            guard let media = animeData.media else {return}
            guard let metaData = animeData.Page else {return}
            self.viewModel?.media.append(contentsOf: media)
            self.viewModel?.metaData = metaData
            self.animeTableView.reloadData()
        case let .getSearchAnimeError(resultError):
            self.viewModel?.errorMessage = resultError
        }
    }
}

extension MainVC {
    func searchButtonSetUp () {
        searchButton.addTarget(self, action: #selector(didSearchButtonGotPressed), for: .touchUpInside)
    }
    
    @objc func didSearchButtonGotPressed () {
        viewModel?.searchTerm = searchTextField.text ?? ""
        interactor?.searchAnime(viewModel?.currentPage ?? 0, viewModel?.perPage ?? 0, searchTerm: viewModel?.searchTerm ?? "")
    } 
    
    enum State {
        case getSearchAnimeData(AnimeSearchResultModel)
        case getSearchAnimeError(String)
    }
}
