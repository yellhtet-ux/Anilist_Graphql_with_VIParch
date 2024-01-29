//
//  MainScene.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import UIKit

class MainScene {
    static func create () -> UIViewController{
        let viewController = MainVC()
        let interactor = MainVCInteractor()
        let presenter = MainVCPresenter()
        let worker = MainVCAnimeSearchingWorker()
        let viewModel = MainVCViewModel()
        
        viewController.interactor = interactor
        viewController.viewModel = viewModel
        
        interactor.presenter = presenter
        interactor.worker = worker
        
        worker.delegate = interactor
        worker.networkService = GNetworkService.shared
        
        presenter.viewController = viewController
        
        return viewController
    }
}
