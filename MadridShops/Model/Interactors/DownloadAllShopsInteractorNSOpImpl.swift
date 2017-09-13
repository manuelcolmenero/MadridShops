//
//  DownloadAllShopsInteractorNSOpImpl.swift
//  MadridShops
//
//  Created by Manuel Colmenero Navarro on 11/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorNSOpImpl: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping shopsClosure) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure = nil) {
        
        let urlString =  "https://madrid-shops.com/json_new/getShops.php"
        
        let queue = OperationQueue()
        queue.addOperation {
            
            if let url = URL(string: urlString), let data = NSData(contentsOf: url) as Data? {
                
                let shops = parseShops(data: data)
                
                OperationQueue.main.addOperation {
                    onSuccess(shops)
                }
            }
        }
    }
}
