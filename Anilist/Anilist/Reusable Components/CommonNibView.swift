//
//  CommonNibView.swift
//  Anilist
//
//  Created by Andrew Hardin on 1/30/24.
//

import Foundation
import UIKit.UIView

protocol CommonNib : UIView {
    var nibContainerView: UIView? {get }
    var nibContentView : UIView? {get set}
    
    var nib : UINib? {get}
    
    func loadFromNib ()
    
}

protocol LoadViewControllerFromNib : UIViewController {
    var nibContainerVC: UIViewController? {get }
    var nibContentVC : UIViewController? {get set}
    
    var nib : UINib? {get}
    
    func loadFromNib ()
}

extension CommonNib where Self: UICollectionViewCell {
    // MARK: Container View Default Implementation for UITableViewCell
    var nibContainerView: UIView? { contentView }
}

extension CommonNib where Self: UITableViewCell {
    var nibContainerView: UIView? {contentView}
}

extension LoadViewControllerFromNib where Self: UIViewController {
    var nibName: String {
        type(of: self).description()
            .components(separatedBy: ".")
            .last ?? ""
    }
    
    var nibContainerVC : UIViewController? { self }
    
    func loadFromNib () {
        if nibContentVC != nil {return}
       
        var  nibFile = self.nib
        if nibFile == nil {
            nibFile = UINib(nibName: nibName, bundle: Bundle(for: type(of: self)))
        }
        
        let nibItems = nibFile?.instantiate(withOwner: self, options: nil) ?? []
        
        for nibItem in nibItems {
            if let contianerView = nibContainerVC, let nibView = nibItem as? UIViewController {
                nibContentVC = nibView
            }
        }
    }
}


extension CommonNib where Self: UIView {
    
    var nibName: String {
        type(of: self).description()
            .components(separatedBy: ".")
            .last ?? ""
    }
    
    var nibContainerView : UIView? {self}
    
    func loadFromNib () {
        if nibContentView != nil {return}
       
        var  nibFile = self.nib
        if nibFile == nil {
            nibFile = UINib(nibName: nibName, bundle: Bundle(for: type(of: self)))
        }
        
        let nibItems = nibFile?.instantiate(withOwner: self, options: nil) ?? []
        
        for nibItem in nibItems {
            if let contianerView = nibContainerView, let nibView = nibItem as? UIView {
                nibContentView = nibView
                attachNib(from: nibView, to: contianerView)
            }
        }
    }
}

extension CommonNib {
    private func attachNib(from view: UIView, to attachableView: UIView) {
        backgroundColor = backgroundColor
        
        view.translatesAutoresizingMaskIntoConstraints = false
        attachableView.addSubview(view)
        
        NSLayoutConstraint.activate([
            attachableView.topAnchor.constraint(equalTo: view.topAnchor),
            attachableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            attachableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            attachableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}


class NibView: UIView, CommonNib {
    var nibContentView: UIView?
    
    var nib: UINib? {nil}
    
    var nibContainerView: UIView? {self}
    
    override var backgroundColor: UIColor? {
        set {
            super.backgroundColor = newValue
            nibContentView?.backgroundColor = newValue
        }
        get {
            super.backgroundColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
}

class NibViewController : UIViewController, LoadViewControllerFromNib {
    var nibContainerVC: UIViewController? {self}
    
    var nibContentVC: UIViewController?
    
    var nib: UINib?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nil)
    }
}

class NibCollectionViewCell: UICollectionViewCell, CommonNib {
    var nibContentView: UIView?
    
    var nib: UINib? { nil }
    
    var nibContainerView: UIView? { contentView }
    
    override init(frame: CGRect) {
        super.init(frame: frame) ; loadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder) ; loadFromNib()
    }
}

class NibTableViewCell: UITableViewCell, CommonNib {
    var nibContentView: UIView?
    
    var nib: UINib? {nil}
    
    var nibContainerView: UIView? { contentView }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        loadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
}
