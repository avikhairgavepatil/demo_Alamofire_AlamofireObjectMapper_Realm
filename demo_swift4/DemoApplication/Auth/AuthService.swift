//
//  AuthService.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

typealias AuthResult = (_ token: String?, _ error: Error?) -> ()


protocol AuthService: class {
    
    func authorize(completion: @escaping AuthResult)
}
