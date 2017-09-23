//
//  ViewController.swift
//  MadridShops
//
//  Created by Manuel Colmenero Navarro on 7/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var context : NSManagedObjectContext!
    let locationManager = CLLocationManager()

    @IBOutlet weak var shopsCollectionView: UICollectionView!
    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Petición de localización del usuario
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        ExecutedOnceInteractorImpl().execute {
            initializeData()
        }
        
        self.shopsCollectionView.delegate   = self
        self.shopsCollectionView.dataSource = self
        
        let madridLocation = CLLocation(latitude:  40.416775, longitude: -3.703790)
        self.map.setCenter(madridLocation.coordinate, animated: true)
    }
    
    func initializeData() {
        let downloadShopsInteractor : DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl()
        
        downloadShopsInteractor.execute { (shops: Shops) in
            
            // Cuando se termina de obtener de internet las shops se guardan en local
            let cacheInteractor = SaveAllShopsInteractorImpl()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                
                SetExecutedOnceInteractorImp().execute()
                
                self._fetchedResultsController = nil
                self.shopsCollectionView.delegate   = self
                self.shopsCollectionView.dataSource = self
                self.shopsCollectionView.reloadData()
            })
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shop : ShopCD = self.fetchedResultsController.object(at: indexPath)
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
            let shopCD : ShopCD = sender as! ShopCD
            
            // se le añade
            vc.shop = mapShopCDIntoShop(shopCD: shopCD)
        }
    }
    
    // MARK: - Fetched results controller
    
    var _fetchedResultsController: NSFetchedResultsController<ShopCD>? = nil

    
    var fetchedResultsController: NSFetchedResultsController<ShopCD> {
        
        // Lazy hace lo mismo que preguntar si ya existe y en caso de ser cierto lo devuelve
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        // NSFetchRequest es el equivalente a SELECT *
        let fetchRequest: NSFetchRequest<ShopCD> = ShopCD.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ShopCacheFile")
        //aFetchedResultsController.delegate = self
        
        do {
            // Se ejecuta la consulta
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        self.map.setCenter(location.coordinate, animated: true)
    }

}

