//
//  ViewController.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This is the demo app's main view controller. It lists movie
 items based on if the user has picked the "top grossing" or
 "top rated" option in the segmented control.
 
 The demo app uses storyboards only for simplicity. Whenever
 you use xibs or code to create a view controller, make sure
 to inject dependencies in `init` instead of `IoC.resolve()`.
 
 */

import UIKit

class ViewController: UIViewController {

    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
    }
    
    
    // MARK: - Dependencies
    
    lazy var movieService: MovieService = IoC.resolve()
    
    
    // MARK: - Properties
    
    private var dataSource: DataSource {
        let index = dataSourcePicker?.selectedSegmentIndex ?? 0
        switch index {
        case 0: return .topGrossing
        case 1: return .topRated
        default: return .topGrossing
        }
    }
    
    private var movies = [Movie]()
    
    
    // MARK: - Types
    
    private enum DataSource {
        case topGrossing, topRated
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var dataSourcePicker: UISegmentedControl? {
        didSet {
            let action = #selector(reloadData)
            dataSourcePicker?.addTarget(self, action: action, for: .valueChanged)
        }
    }
    
    @IBOutlet weak var tableView: UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
        }
    }
}


// MARK: - Private Functions

private extension ViewController {
    
    @objc func reloadData() {
        switch dataSource {
        case .topGrossing: reloadDataWithTopGrossningMovies()
        case .topRated: reloadDataWithTopRatedMovies()
        }
    }
    
    func reloadDataWithTopGrossningMovies() {
        movieService.getTopGrossingMovies(year: 2016, completion: reloadDataDidFinish)
    }
    
    func reloadDataWithTopRatedMovies() {
        movieService.getTopRatedMovies(year: 2016, completion: reloadDataDidFinish)
    }
    
    func reloadDataDidFinish(_ movies: [Movie], _ error: Error?) {
        self.movies = movies
        tableView?.reloadData()
    }
}


// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func movie(at indexPath: IndexPath) -> Movie {
        return movies[indexPath.row]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let movie = self.movie(at: indexPath)
        let names = movie.cast.map { $0.name }
        cell.textLabel?.text = "\(movie.name) (\(movie.year))"
        cell.detailTextLabel?.text = names.joined(separator: ", ")
        return cell
    }
}


// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = self.movie(at: indexPath)
        print("selected \(movie)")
    }
}
