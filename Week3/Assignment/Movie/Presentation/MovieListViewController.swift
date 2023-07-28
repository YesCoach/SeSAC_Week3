//
//  MovieListViewController.swift
//  Week3
//
//  Created by 박태현 on 2023/07/28.
//

import UIKit

final class MovieListViewController: UITableViewController {

    private var data: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension MovieListViewController {
    func configureUI() { }
    func configureData() {
        data = MovieInfo().movie
    }
}
