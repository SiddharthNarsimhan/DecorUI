//
//  CollectionListDetail.swift
//  DecorMainUI
//
//  Created by Siddharth Narsimhan on 12/29/16.
//  Copyright © 2016 Siddharth Narsimhan. All rights reserved.
//

import Foundation
import UIKit

class collectionDetail: BaseCell, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        
        return cv
    }()
    override func setup() {
        super.setup()
        
        let cellid = "cellid"
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addSubview(collectionView)
        
        addConstraintsWithFormat("H:|-[v0]-|", [], views: collectionView)
        addConstraintsWithFormat("V:|-100-[v0]-|", [], views: collectionView)
        
        collectionView.register(detailCell.self, forCellWithReuseIdentifier: cellid)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 100)
    }}
class detailCell : BaseCell {
    let productImage : UIView = {
        
        let pImage = UIImageView()
        pImage.image = UIImage(named: "r01_c05")
        pImage.contentMode = .scaleAspectFill
        pImage.layer.cornerRadius = 8
        pImage.layer.masksToBounds = true
        return pImage
        
    }()
    let details : UITextView = {
        let text = UITextView()
        text.text = "This the description of the furniture part of this collection list."
        if #available(iOS 10.0, *) {
            text.adjustsFontForContentSizeCategory = true
        } else {
            // Fallback on earlier versions
        }
        text.font?  = UIFont.boldSystemFont(ofSize: 14)
        text.textColor = UIColor.lightGray
        return text
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Product Name"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override func setup() {
        super.setup()
        //            backgroundColor = UIColor.yellow
        
        
        
        addSubview(productImage)
        addSubview(nameLabel)
        addSubview(details)
        addConstraintsWithFormat("H:|-[v0(100)]-[v1]-|", [], views: productImage, nameLabel)
        addConstraintsWithFormat("V:|-[v0]-|", [], views: productImage)
        addConstraintsWithFormat("H:[v0]-[v1]-|", [], views: productImage, details)
        addConstraintsWithFormat("V:|-[v0]-[v1]-|", [.alignAllLeft], views: nameLabel,details)
    }
    
    
}
