//
//  JSONParser.swift
//  MadridShops
//
//  Created by Manuel Colmenero Navarro on 12/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

func parseShops (data: Data) -> Shops {
    let shops = Shops()
    
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments ) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        for shopJson in result {
            let shop          = Shop(name: shopJson["name"]! as! String)
            shop.address      = shopJson["address"]          as! String
            shop.description  = shopJson["description_es"]   as! String
            shop.latitude     = shopJson["gps_lat"]          as? Float
            shop.longitude    = shopJson["gps_lon"]          as? Float
            shop.image        = shopJson["img"]              as! String
            shop.logo         = shopJson["logo_img"]         as! String
            shop.openingHours = shopJson["opening_hours_es"] as! String
            
            shops.add(shop: shop)
        }
    } catch {
        // Muestreo del error
    }
    return shops
}
