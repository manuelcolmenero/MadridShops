//
//  SetExecutedOnceInteractorImpl.swift
//  MadridShops
//
//  Created by Manuel Colmenero Navarro on 23/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

class SetExecutedOnceInteractorImp: SetExecutedOnceInteractor {
    func execute() {
        let defaults = UserDefaults.standard
        
        // Se asigna valor a UserDefaults
        defaults.set("SAVED", forKey: "once")
        
        // Se graba el valor
        defaults.synchronize()
    }
}
