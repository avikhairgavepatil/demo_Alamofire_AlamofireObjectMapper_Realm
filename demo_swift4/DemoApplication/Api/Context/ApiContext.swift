//
//  ApiContext.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 An api context is used to provide all information needed to
 communicate with the api.
 
 */

import Foundation

protocol ApiContext {
    
    var authToken: String? { get set }
    var environment: ApiEnvironment { get set }
}
