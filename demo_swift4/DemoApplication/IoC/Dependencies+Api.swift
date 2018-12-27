//
//  Dependencies+Api.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 Call `registerApi(...)` during the registration process and
 `setupApi()` after calling `IoC.register(...)`.
 
 */

import Dip
import Alamofire

extension Dependencies {
    
    static func registerApi(with dip: DependencyContainer) {
        dip.register(.singleton) {
            NonPersistentApiContext(environment: .production) as ApiContext
        }
        
        dip.register {
            AlamofireAuthService(context: $0) as AuthService
        }
        
        dip.register {
            AlamofireMovieService(context: $0) as MovieService
        }
    }
    
    static func setupApi() {
        let manager = SessionManager.default
        manager.adapter = ApiRequestAdapter(context: IoC.resolve())
        manager.retrier = ApiRequestRetrier(context: IoC.resolve(), authService: IoC.resolve())
    }
}
