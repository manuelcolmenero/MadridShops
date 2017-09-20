//
//  SaveAllShopsInteractorImpl.swift
//  MadridShops
//
//  Created by Manuel Colmenero Navarro on 15/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation
import CoreData

class SaveAllShopsInteractorImpl: SaveAllShopsInteractor {
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping shopsClosure, onError: errorClosure) {
        
        for indexFor in 0 ..< shops.count() {
            let shop = shops.get(index: indexFor)
            
            // Mapping shop into ShopCD
            let shopCD              = ShopCD(context: context)
            shopCD.name             = shop.name
            shopCD.address          = shop.address
            shopCD.image            = shop.image
            shopCD.logo             = shop.logo
            /*
            shopCD.description_es   = shop.description
            shopCD.latitude         = shop.latitude!
            shopCD.longitude        = shop.longitude!
            shopCD.openingHours     = shop.openingHours
            */
        }
        
        do {
            try context.save()
            onSuccess(shops)
        } catch {
//            Código de error a devolver
//            onError(nil)
        }
        
    }
    
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping shopsClosure) {
        execute(shops: shops, context: context, onSuccess: onSuccess, onError: nil)
    }
    
    
}
