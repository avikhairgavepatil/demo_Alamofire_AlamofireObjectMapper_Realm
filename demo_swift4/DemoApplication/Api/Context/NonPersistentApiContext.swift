//
//  NonPersistentApiContext.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This api context implementation doesn't persist any changes,
 which is good for a demo. In a real-world app, changes made
 to the contexst should probably be persisted.
 
 */

import Foundation

class NonPersistentApiContext: ApiContext {
    
    init(environment: ApiEnvironment) {
        self.environment = environment
    }
    
    var authToken: String?
    var environment: ApiEnvironment
}
