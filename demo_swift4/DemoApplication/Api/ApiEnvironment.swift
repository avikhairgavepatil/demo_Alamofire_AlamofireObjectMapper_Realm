//
//  ApiEnvironment.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This enum can be used to specify the different environments
 this api integration can communicate with.
 
 */

import Foundation

enum ApiEnvironment: String { case
    
    production = "http://danielsaidi.com/demo_Alamofire_AlamofireObjectMapper_Realm/api/"
    
    var url: String {
        return rawValue
    }
}
