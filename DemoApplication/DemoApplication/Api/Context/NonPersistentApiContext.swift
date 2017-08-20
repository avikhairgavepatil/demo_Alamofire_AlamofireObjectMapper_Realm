//
//  NonPersistentApiContext.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2017-08-21.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Foundation

class NonPersistentApiContext: NSObject, ApiContext {
    
    init(environment: ApiEnvironment) {
        self.environment = environment
        super.init()
    }
    
    var environment: ApiEnvironment
}
