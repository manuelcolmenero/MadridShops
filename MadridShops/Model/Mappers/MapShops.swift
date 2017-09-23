//
//  MapShops.swift
//  MadridShops
//
//  Created by Manuel Colmenero Navarro on 23/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation
import CoreData

func mapShopCDIntoShop (shopCD : ShopCD) -> Shop {
    // Mapping ShopCD into Shop
    let shop                = Shop(name: shopCD.name ?? "Empty")
    shop.address            = shopCD.address ?? ""
    shop.image              = shopCD.image ?? ""
    shop.logo               = shopCD.logo ?? ""
    
    shop.latitude           = shopCD.latitude
    shop.longitude          = shopCD.longitude
    shop.openingHours       = shopCD.openingHours ?? ""
   
//    Sistema de validación de campos clasico
//    if let desc = shopCD.description_en {
//        shop.description = desc
//    } else {
//        shop.description = ""
//    }
  
//    Opción de pregunta con datos que se está seguro que tiene datos.
//    En caso de no tener datos genera error
//    shop.description        = shopCD.description_es!
    
    shop.description        = shopCD.description_es ?? ""
    
    return shop
}

func mapShopIntoShopCD (context: NSManagedObjectContext, shop: Shop) -> ShopCD {
    
    // Mapping shop into ShopCD
    let shopCD              = ShopCD(context: context)
    shopCD.name             = shop.name
    shopCD.address          = shop.address
    shopCD.image            = shop.image
    shopCD.logo             = shop.logo
    
    shopCD.latitude         = shop.latitude ?? 0
    shopCD.longitude        = shop.longitude ?? 0
    shopCD.openingHours     = shop.openingHours
    shopCD.description_es   = shop.description
    
    return shopCD
}
