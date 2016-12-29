//
//  ProductList.swift
//  DecorMainUI
//
//  Created by Siddharth Narsimhan on 12/28/16.
//  Copyright © 2016 Siddharth Narsimhan. All rights reserved.
//

import Foundation
import UIKit
class productList : UIViewController, UITableViewDelegate, UITableViewDataSource {
     fileprivate let cellid = "productrowid"
    
    var tableView = UITableView()
    var sections = ["Chairs","Sofas", "Side Tables", "Dressers"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Product List"
       tableView.register(productRow.self, forCellReuseIdentifier: cellid)
    }
    
    func showProductList()
    {
        let productlistcontroller = productList()
        navigationController?.pushViewController(productlistcontroller, animated: true)
    }
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int ) -> String? {
        return sections[section]
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid) as! productRow
        cell.imageView?.image = UIImage(named: sections[indexPath.row])
        return cell
    }
    
}

class productRow : UITableViewCell {
    
    required init(coder : NSCoder){
        super.init(coder: coder)!
        setup()
        
    }
    
    let ProductImage : UIImageView = {
        let img = UIImageView()
        
        return img
    }()
    func setup(){
        addSubview(ProductImage)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : ProductImage]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : ProductImage]))
    }
    }

