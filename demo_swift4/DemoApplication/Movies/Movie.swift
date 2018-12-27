//
//  Movie.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

struct Movie {
    
    let id: Int
    let name: String
    let year: Int
    let releaseDate: Date
    let grossing: Int
    let rating: Double
    
    let cast: [MovieActor]
}
