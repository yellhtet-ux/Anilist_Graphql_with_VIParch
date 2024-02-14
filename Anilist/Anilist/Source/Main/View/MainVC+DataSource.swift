//
//  MainVC+DataSource.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/30/24.
//

import UIKit

extension MainVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.media.count  ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "anime_cell", for: indexPath) as! AnimeTableViewCell
        cell.textViewSetUp()
        cell.animeMediaData = viewModel?.media[indexPath.row] 
        return cell
    }
    
    
}
