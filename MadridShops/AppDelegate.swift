//
//  AppDelegate.swift
//  MadridShops
//
//  Created by Manuel Colmenero Navarro on 7/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var cds = CoreDataStack()
    var context: NSManagedObjectContext?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Crea una BBDD y lee una definición de objeto llamado igual
        self.context = cds.createContainer(dbName: "MadridShops").viewContext
        
        self.cds.saveContext(context: self.context!)
        
        let nav = self.window?.rootViewController as! UINavigationController
        let mainVC = nav.topViewController as! MainViewController
        mainVC.context = self.context!
        
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        guard self.context != nil else { return }
        self.cds.saveContext(context: self.context!)
        
    }
}

