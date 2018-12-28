//
//  RealmMovieService.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-28.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This movie service persists any movies it receives from its
 base service into Realm. This means that it can be injected
 as a wrapper for any movie service provide offline support.
 
 */

import RealmSwift

class RealmMovieService: MovieService {

    
    // MARK: - Initialization
    
    init(baseService: MovieService) {
        self.baseService = baseService
    }
    
    
    // MARK: - Dependencies
    
    private let baseService: MovieService
    private var realm: Realm { return try! Realm() }
    
    
    // MARK: - Functions
    
    func getMovie(id: Int, completion: @escaping MovieResult) {
        getMovieFromDb(id: id, completion: completion)
        getMovieFromBaseService(id: id, completion: completion)
    }
    
    func getTopGrossingMovies(year: Int, completion: @escaping MoviesResult) {
        getTopGrossingMoviesFromDb(year: year, completion: completion)
        getTopGrossingMoviesFromBaseService(year: year, completion: completion)
    }
    
    func getTopRatedMovies(year: Int, completion: @escaping MoviesResult) {
        getTopRatedMoviesFromDb(year: year, completion: completion)
        getTopRatedMoviesFromBaseService(year: year, completion: completion)
    }
}


// MARK: - Database Functions

private extension RealmMovieService {
    
    func getMovieFromDb(id: Int, completion: @escaping MovieResult) {
        let obj = realm.object(ofType: RealmMovie.self, forPrimaryKey: id)
        guard let movie = obj?.convert() else { return }
        completion(movie, nil)
    }
    
    func getTopGrossingMoviesFromDb(year: Int, completion: @escaping MoviesResult) {
        let objs = realm.objects(RealmMovie.self).filter("year == \(year)")
        let sorted = objs.sorted { $0.grossing > $1.grossing }.map { $0.convert() }
        completion(sorted, nil)
    }
    
    func getTopRatedMoviesFromDb(year: Int, completion: @escaping MoviesResult) {
        let objs = realm.objects(RealmMovie.self).filter("year == \(year)")
        let sorted = objs.sorted { $0.rating > $1.rating }.map { $0.convert() }
        completion(sorted, nil)
    }
    
    func persist(_ movie: Movie?) {
        persist([movie].compactMap { $0 })
    }
    
    func persist(_ movies: [Movie]) {
        let objs = movies.map { RealmMovie(from: $0) }
        try! realm.write {
            realm.add(objs, update: true)
        }
    }
}


// MARK: - Base Service Functions

private extension RealmMovieService {
    
    func getMovieFromBaseService(id: Int, completion: @escaping MovieResult) {
        baseService.getMovie(id: id) { [weak self] (movie, error) in
            self?.persist(movie)
            completion(movie, error)
        }
    }
    
    func getTopGrossingMoviesFromBaseService(year: Int, completion: @escaping MoviesResult) {
        baseService.getTopGrossingMovies(year: year) { [weak self] (movies, error) in
            self?.persist(movies)
            completion(movies, error)
        }
    }
    
    func getTopRatedMoviesFromBaseService(year: Int, completion: @escaping MoviesResult) {
        baseService.getTopRatedMovies(year: year) { [weak self] (movies, error) in
            self?.persist(movies)
            completion(movies, error)
        }
    }
}
