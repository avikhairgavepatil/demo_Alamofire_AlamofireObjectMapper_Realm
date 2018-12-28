//
//  RealmMovie.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-28.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import RealmSwift

class RealmMovie: Object {
    
    
    // MARK: - Initialization
    
    convenience init(from: Movie) {
        self.init()
        self.id = from.id
        self.name = from.name
        self.year = from.year
        self.releaseDate = from.releaseDate
        self.grossing = from.grossing
        self.rating = from.rating
        from.cast
            .map { RealmMovieActor(from: $0) }
            .forEach { self.cast.append($0) }
    }
    
    
    // MARK: - Properties
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var year = 0
    @objc dynamic var releaseDate = Date(timeIntervalSince1970: 0)
    @objc dynamic var grossing = 0
    @objc dynamic var rating = 0.0
    let cast = List<RealmMovieActor>()
    
    
    // MARK: - Primary Key
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    
    // MARK: - Functions
    
    func convert() -> Movie {
        return Movie(
            id: id,
            name: name,
            year: year,
            releaseDate: releaseDate,
            grossing: grossing,
            rating: rating,
            cast: cast.map { $0.convert() }
        )
    }
}
