//
//  DownloadAllShopsInteractorFakeImpl.swift
//  MadridShops
//
//  Created by Manuel Colmenero Navarro on 7/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorFakeImpl: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping shopsClosure) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure = nil) {
        let shops = Shops()
        
        for index in 0...10 {
            let shop = Shop(name: "Shop number \( index )")
            shop.address = "Address \( 1 )"
            shops.add(shop: shop)
        }
        
        OperationQueue.main.addOperation {
            onSuccess(shops)
        }
        
    }
    

}
