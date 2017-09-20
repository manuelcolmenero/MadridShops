//
//  ViewController.swift
//  MadridShops
//
//  Created by Manuel Colmenero Navarro on 7/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var context : NSManagedObjectContext!
    var shops   : Shops?

    @IBOutlet weak var shopsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        let downloadShopsInteractor : DownloadAllShopsInteractor = DownloadAllShopsInteractorNSOpImpl()
        let downloadShopsInteractor : DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl()
        
        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
            // Se ha ejecutado correctamente
//            print ("Name: " + shops.get(index: 0).name)
//            print ("Address: " + shops.get(index: 0).address)
            
            self.shops = shops
            
            self.shopsCollectionView.delegate   = self
            self.shopsCollectionView.dataSource = self
            
            // Cuando se termina de obtener de internet las shops se guardan en local
            let cacheInteractor = SaveAllShopsInteractorImpl()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                
            })
            
        }) { (error: Error) in
            // Se han procedido un error
            
        }
//        Ejemplos de llamadas
//        downloadShopsInteractor.execute { (shops: Shops) in
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shop = self.shops?.get(index: indexPath.row)
        self.performSegue(withIdentifier: "ShowShopDetailSegue", sender: shop)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopDetailSegue" {
            let vc = segue.destination as! ShopDetailViewController
            
//            // Se recupera cual es la celda donde se ha pulsado del collectionView
//            let indexPath = self.shopsCollectionView.indexPathsForSelectedItems![0]
//            
//            // Se recupera la tienda asociada al indexPath recuperado
//            let shop = self.shops?.get(index: indexPath.row)
//            
            // se le añade
            vc.shop = sender as! Shop
        }
    }
}

