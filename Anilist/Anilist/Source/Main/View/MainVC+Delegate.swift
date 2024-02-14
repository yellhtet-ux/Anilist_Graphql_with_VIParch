//
//  MainVC+Delegate.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/30/24.
//

import UIKit   

extension MainVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.row == viewModel.media.count - 1 else {return}
        if viewModel.isLoading {
            interactor?.loadMore(viewModel.searchTerm)
            viewModel.isLoading = false
        }
    }
}
