//
//  Dependencies+Movies.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Dip

extension Dependencies {
    
    static func registerMovies(with dip: DependencyContainer) {
        dip.register {
            AlamofireMovieService(context: $0) as MovieService
        }
    }
}
