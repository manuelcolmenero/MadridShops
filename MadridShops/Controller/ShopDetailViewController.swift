//
//  ShopDetailViewController.swift
//  MadridShops
//
//  Created by Manuel Colmenero Navarro on 12/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController {
    
    // shop siempre tendrá valor
    var shop : Shop!

    @IBOutlet weak var shopDetailDescription: UITextView!
    @IBOutlet weak var shopImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.shop.name
        self.shopDetailDescription.text = self.shop.description
        self.shop.image.loadImage(into: shopImage)
        
    }
}
