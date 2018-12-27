//
//  AlamofireService.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Alamofire

class AlamofireService {
    
    init(context: ApiContext) {
        self.context = context
    }
    
    
    var context: ApiContext
    
    
    func get(at route: ApiRoute) -> DataRequest {
        return request(at: route, method: .get, encoding: URLEncoding.default)
    }
    
    func post(at route: ApiRoute) -> DataRequest {
        return request(at: route, method: .post, encoding: JSONEncoding.default)
    }
    
    func put(at route: ApiRoute) -> DataRequest {
        return request(at: route, method: .put, encoding: JSONEncoding.default)
    }
    
    func request(at route: ApiRoute, method: HTTPMethod, params: Parameters = [:], encoding: ParameterEncoding) -> DataRequest {
        let url = route.url(for: context.environment)
        return Alamofire
            .request(url, method: method, parameters: params, encoding: encoding)
            .validate()
    }
}
