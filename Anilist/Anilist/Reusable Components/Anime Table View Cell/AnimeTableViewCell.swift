//
//  AnimeTableViewCell.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/30/24.
//

import UIKit
import SDWebImage

class AnimeTableViewCell: NibTableViewCell {

    @IBOutlet weak var descriptionTextLbl: UITextView!
    @IBOutlet weak var episodesLbl: UILabel!
    @IBOutlet weak var completeAirDateLbl: UILabel!
    @IBOutlet weak var startAirDateLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var nativeNameLbl: UILabel!
    @IBOutlet weak var englishNameLbl: UILabel!
    @IBOutlet weak var animeAvaterImg: UIImageView!
    
    func textViewSetUp () {
        descriptionTextLbl.isEditable = false
        descriptionTextLbl.isScrollEnabled = false
    }
    
    var animeMediaData : Media? {
        didSet {
            refreshUI ()
        }
    }
}

extension AnimeTableViewCell {
    var englishTitle : String {
        get {englishNameLbl.text ?? ""}
        set {englishNameLbl.text = newValue}
    }
    
    var nativeName : String {
        get {nativeNameLbl.text ?? ""}
        set {nativeNameLbl.text = newValue}
    }
    
    var type: String {
        get {typeLbl.text ?? ""}
        set {typeLbl.text = newValue}
    }
    
    var startAirDate: String {
        get {startAirDateLbl.text ?? "" }
        set {startAirDateLbl.text  = newValue}
    }
     
    var endAirDate: String {
        get {completeAirDateLbl.text ?? ""}
        set {completeAirDateLbl.text = newValue}
    }
    
    var episodes : String {
        get {episodesLbl.text ?? ""}
        set {episodesLbl.text = newValue}
    }
    
    var animeDescription: String {
        get {descriptionTextLbl.text ?? ""}
        set {descriptionTextLbl.text = newValue}
    }
    
    private func refreshUI (){
        self.englishTitle = "English Name: \(animeMediaData?.title?.english ?? "")"
        self.nativeName = "Native Name: \(animeMediaData?.title?.native ?? "")"
        self.type = "Series/Movies Type: \(animeMediaData?.type ?? "")"
        self.startAirDate = "Start Airing Date: \(animeMediaData?.startDate?.day ?? 0)-\(animeMediaData?.startDate?.month ?? 0)-\(animeMediaData?.startDate?.year ?? 0)"
        self.endAirDate = "Start Airing Date: \(animeMediaData?.endData?.day ?? 0)-\(animeMediaData?.endData?.month ?? 0)-\(animeMediaData?.endData?.year ?? 0)"
        self.episodes = "Episodes: \(animeMediaData?.episodes ?? 0)"
        self.animeDescription = "\(animeMediaData?.description ?? "")"
        guard let url = URL(string: animeMediaData?.coverImage?.large ?? "") else {return}
        self.animeAvaterImg.sd_setImage(with: url)
    }
}
