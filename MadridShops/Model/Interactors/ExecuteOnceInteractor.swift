//
//  ExecuteOnceInteractor.swift
//  MadridShops
//
//  Created by Manuel Colmenero Navarro on 23/9/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation

// Se invoca con un código y si no se ha ejecutado antes lo ejecuta
protocol ExecuteOnceInteractor {
    func execute(closure: () -> Void)
    
}
