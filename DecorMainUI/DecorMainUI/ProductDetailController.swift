//
//  ProductDetailController.swift
//  DecorMainUI
//
//  Created by Siddharth Narsimhan on 12/29/16.
//  Copyright © 2016 Siddharth Narsimhan. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    fileprivate let headerId = "headerId"
    fileprivate let cellid = "cellid"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(AppDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(collectionDetail.self, forCellWithReuseIdentifier: cellid)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppDetailHeader
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width/2)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 500)
    }
    
}

class AppDetailHeader: BaseCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        //        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Details"])
        sc.tintColor = UIColor.darkGray
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let viewInRoomButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("View in room", for: UIControlState())
        button.layer.borderColor = UIColor(red: 0, green: 129/255, blue: 250/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setup() {
     super.setup()
        
        addSubview(imageView)
        addSubview(segmentedControl)
        //        addSubview(nameLabel)
        addSubview(viewInRoomButton)
        addSubview(dividerLineView)
        
        addConstraintsWithFormat("H:|-[v0]-|",[.alignAllCenterY], views: imageView)
        addConstraintsWithFormat("V:|-[v0(200)]-[v1(32)]-[v2(34)]-[v3(0.5)]",[.alignAllCenterX] ,views: imageView,viewInRoomButton, segmentedControl, dividerLineView)
        
        //        addConstraintsWithFormat("V:|-14-[v0(20)]", views: nameLabel)
        
        addConstraintsWithFormat("H:|-[v0]-|", [.alignAllCenterY],views: segmentedControl)
        //        addConstraintsWithFormat("V:[v0(34)]-8-|", views: segmentedControl)
        
        addConstraintsWithFormat("H:|-100-[v0]-100-|",[.alignAllCenterY], views: viewInRoomButton)
        //        addConstraintsWithFormat("V:[v0(32)]-56-|", views: buyButton)
        
        addConstraintsWithFormat("H:|[v0]|",[], views: dividerLineView)
        //        addConstraintsWithFormat("V:[v0(0.5)]|", views: dividerLineView)
    }
    
}

extension UIView {
    
    func addConstraintsWithFormat(_ format: String,_ option: NSLayoutFormatOptions,views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
    }
}

