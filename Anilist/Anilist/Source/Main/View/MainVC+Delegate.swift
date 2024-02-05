//
//  MainVC+Delegate.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/30/24.
//

import UIKit   

extension MainVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let lastItem = viewModel?.media.count, let isLoading = viewModel?.isLoading {
            if indexPath.row == lastItem - 1  {
                self.paginationSetUp()
            }
        }
    }
}
