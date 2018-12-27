//
//  ApiMovieActor.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import ObjectMapper

class ApiMovieActor {
    
    required public init?(map: Map) {}
    
    var name = ""
    
    func convert() -> MovieActor {
        return MovieActor(name: name)
    }
}


// MARK: - Mappable

extension ApiMovieActor: Mappable {
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}
