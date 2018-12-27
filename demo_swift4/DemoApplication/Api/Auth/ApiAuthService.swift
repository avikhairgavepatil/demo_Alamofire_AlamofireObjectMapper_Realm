//
//  ApiAuthService.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class ApiAuthService: AlamofireService, AuthService {
    
    func authorize(completion: @escaping AuthResult) {
        get(at: .auth).responseString { (response: DataResponse<String>) in
            if let token = response.result.value {
                self.context.authToken = token
            }
            completion(response.result.value, response.result.error)
        }
    }
}
