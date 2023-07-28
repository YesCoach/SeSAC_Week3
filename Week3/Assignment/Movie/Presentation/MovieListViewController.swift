//
//  MovieListViewController.swift
//  Week3
//
//  Created by 박태현 on 2023/07/28.
//

import UIKit

final class MovieListViewController: UITableViewController {

    private var data: [Movie] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureData()
    }
}

private extension MovieListViewController {
    func configureUI() {
        tableView.rowHeight = 180.0
    }

    func configureData() {
        data = MovieInfo().movie
    }
}

// MARK: - DataSource 구현부

extension MovieListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieListCell.identifer
        ) as? MovieListCell
        else { return UITableViewCell() }

        let movie = data[indexPath.row]
        cell.configure(with: movie) { [weak self] isFavorite in
            self?.data[indexPath.row].isFavorite = isFavorite
        }
        return cell
    }
}
