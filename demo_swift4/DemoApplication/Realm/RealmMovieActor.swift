//
//  RealmMovieActor.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-28.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import RealmSwift

class RealmMovieActor: Object {
    
    convenience init(from actor: MovieActor) {
        self.init()
        self.name = actor.name
    }
    
    @objc dynamic var name = ""
    
    func convert() -> MovieActor {
        return MovieActor(name: name)
    }
}
