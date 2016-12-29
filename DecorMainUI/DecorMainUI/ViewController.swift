//
//  ViewController.swift
//  DecorMainUI
//
//  Created by Siddharth Narsimhan on 12/28/16.
//  Copyright © 2016 Siddharth Narsimhan. All rights reserved.
//

import UIKit

class FeaturedProductsController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
    fileprivate let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         navigationItem.title = "Avastavik AR"
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(FeaturedCell.self, forCellWithReuseIdentifier: cellId)
    }
//    func showProductList()
//    {
//        let productlistcontroller = productList()
//        navigationController?.pushViewController(productlistcontroller, animated: true)
//    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeaturedCell
        return cell

        }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
 }
