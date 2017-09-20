//
//  SaveAllShopsInteractor.swift
//  MadridShops
//
//  Created by Manuel Colmenero Navarro on 15/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation
import CoreData

protocol SaveAllShopsInteractor {
    // execute: all shops. Return on the main thread
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping shopsClosure, onError: errorClosure)
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping shopsClosure)
}
