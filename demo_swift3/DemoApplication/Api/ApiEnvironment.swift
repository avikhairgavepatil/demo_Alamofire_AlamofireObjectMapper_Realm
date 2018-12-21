//
//  ApiEnvironment.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2017-08-21.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Foundation

enum ApiEnvironment: String { case
    
    production = "http://danielsaidi.com/presentation_AlamofireMappableRealm/api/"

    var url: String {
        return rawValue
    }
}
