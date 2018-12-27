//
//  AppDelegate.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This is the main place to register dependencies for the app.
 It uses Dip's `DependencyContainer` as dependency container,
 then registers it to be the default dependency container to
 be used with the static `IoC` class.
 
 */

import Dip
import Alamofire

class Dependencies: NSObject {
    
    static func register() {
        let dip = DependencyContainer()
        registerApi(with: dip)
        registerAuth(with: dip)
        registerMovies(with: dip)
        let container = DipContainer(container: dip)
        IoC.register(container)
        setupApi()
    }
}
