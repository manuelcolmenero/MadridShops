//
//  ShopCell.swift
//  MadridShops
//
//  Created by Manuel Colmenero Navarro on 8/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class ShopCell: UICollectionViewCell {
    var shop : Shop?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    
    func refresh(shop: Shop) {
        self.shop  = shop
        
        // Se informan los campos de la celda
        self.labelView.text = shop.name
        self.shop?.logo.loadImage(into: imageView)
        imageView.clipsToBounds = true
        UIView.animate(withDuration: 1.0) {
            self.imageView.layer.cornerRadius = 25
        }
    }
}
