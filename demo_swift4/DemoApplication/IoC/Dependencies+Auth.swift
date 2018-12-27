//
//  Dependencies+Auth.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Dip

extension Dependencies {
    
    static func registerAuth(with dip: DependencyContainer) {
        dip.register {
            AlamofireAuthService(context: $0) as AuthService
        }
    }
}
