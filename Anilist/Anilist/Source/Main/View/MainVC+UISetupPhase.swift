//
//  File.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/30/24.
//

import UIKit  


extension MainVC  {
    
    internal func configureHierarchy () {
         let margin = view.layoutMarginsGuide
        searchStackViewSetUp (margin: margin)  
        animeTableViewSetUp(margin: margin)
        errorMessageSetUp()
        searchButtonSetUp()
    }
    
    func paginationSetUp () {
        if let totalPages = viewModel?.totalPages {
            if totalPages >= viewModel?.currentPage ?? 0 {
                viewModel?.currentPage += 1
                interactor?.searchAnime(viewModel?.currentPage ?? 0, viewModel?.perPage ?? 0, searchTerm: viewModel?.searchTerm ?? "")
            }
        }
    }
    
    func searchStackViewSetUp (margin: UILayoutGuide) {
        
       view.addSubview(searchStackView)
       searchStackView.addArrangedSubview(searchTextField)
       searchStackView.addArrangedSubview(searchButton)
       
       NSLayoutConstraint.activate([
            
           // MARK: - Search Stack View
           
           searchStackView.topAnchor.constraint(equalTo: margin.topAnchor,constant: 0),
           searchStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
           searchStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
           
           
           // MARK: - Seach Text Field
           
           searchTextField.leadingAnchor.constraint(equalTo: searchStackView.leadingAnchor, constant: 0),
           searchTextField.centerYAnchor.constraint(equalTo: searchStackView.centerYAnchor),
           searchTextField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: 8),
           searchTextField.heightAnchor.constraint(equalToConstant: 45),
           
           // MARK: - Search Button
           
           searchButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor,constant: 8),
           searchButton.centerYAnchor.constraint(equalTo: searchStackView.centerYAnchor),
           searchButton.trailingAnchor.constraint(equalTo: searchStackView.trailingAnchor),
           searchButton.heightAnchor.constraint(equalToConstant: 40),
           searchButton.widthAnchor.constraint(equalToConstant: 70),
       ])
   } 
    
    func animeTableViewSetUp (margin : UILayoutGuide) {
        // MARK: - Table View 
        animeTableView.register(AnimeTableViewCell.self, forCellReuseIdentifier: "anime_cell")
        animeTableView.delegate = self
        animeTableView.backgroundColor = .clear
        animeTableView.dataSource = self
        animeTableView.rowHeight = 375
        animeTableView.showsVerticalScrollIndicator =  false
        
        view.addSubview(animeTableView)
        
        NSLayoutConstraint.activate([
            animeTableView.topAnchor.constraint(equalTo: searchStackView.bottomAnchor,constant: 20),
            animeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animeTableView.bottomAnchor.constraint(equalTo: margin.bottomAnchor)
        ])
    }
    
    func errorMessageSetUp () {
        // MARK: - Error Message 
        view.addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            errorLabel.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
}
