//
//  MovieListViewController.swift
//  Week3
//
//  Created by 박태현 on 2023/07/28.
//

import UIKit

final class MovieListViewController: UITableViewController {

    @IBOutlet var favoriteBarButtonItem: UIBarButtonItem!

    private var data: [Movie] = []
    private var showData: [Movie] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureData()
    }

    @IBAction func didStarButtonTouched(_ sender: UIBarButtonItem) {
        sender.isSelected.toggle()
        sender.image = sender.isSelected ?
            .init(systemName: "star.fill") : .init(systemName: "star")
        showData = sender.isSelected ? data.filter {$0.isFavorite} : data
    }
}

private extension MovieListViewController {
    func configureUI() {
        tableView.rowHeight = 180.0
        favoriteBarButtonItem.tintColor = .black
    }

    func configureData() {
        data = MovieInfo().movie
        showData = data
    }
}

// MARK: - DataSource 구현부

extension MovieListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showData.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieListCell.identifer
        ) as? MovieListCell
        else { return UITableViewCell() }

        let movie = showData[indexPath.row]
        cell.configure(with: movie) { [weak self] isFavorite in
            if let index = self?.data.firstIndex(where: { $0.title == movie.title }) {
                self?.data[index].isFavorite = isFavorite
            }
        }
        return cell
    }
}
