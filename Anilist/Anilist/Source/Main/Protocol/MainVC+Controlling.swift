//
//  MainVC+Controlling.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import Foundation

protocol MainVCControlling {
    var interactor: MainVCInteracting? {get set}
    var viewModel: MainVCViewModel? {get set}
    var router : MainVCRouting? {get set}
    
    func render (_ state: MainVC.State)
}
