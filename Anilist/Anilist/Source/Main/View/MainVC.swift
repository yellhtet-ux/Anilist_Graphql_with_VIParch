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
            if media.isEmpty {
                self.errorLabel.isHidden = false
                self.errorLabel.text = "There's no Data for your Keywords"
                self.animeTableView.isHidden = true
            }else {
                self.viewModel?.media.append(contentsOf: media)
                self.viewModel?.totalPages = metaData.total ?? 0
                self.animeTableView.isHidden = false
                self.errorLabel.isHidden = true
                self.animeTableView.reloadData()
            }
        case let .getSearchAnimeError(resultError):
            self.viewModel?.errorMessage = resultError
            self.errorLabel.text = viewModel?.errorMessage
            animeTableView.isHidden = true 
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
