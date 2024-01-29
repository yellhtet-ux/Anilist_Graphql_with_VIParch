//
//  MainVC+Presenting.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/29/24.
//

import Foundation

protocol MainVCPresenting {
    var viewController : MainVCControlling? {get set}
    
    func present(_ state: MainVC.State) 
}
