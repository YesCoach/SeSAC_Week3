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
    private var isFavorite: Bool = false {
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
        isFavorite = sender.isSelected
    }
}

private extension MovieListViewController {
    func configureUI() {
        tableView.rowHeight = 180.0
        favoriteBarButtonItem.tintColor = .black
    }

    func configureData() {
        data = MovieInfo().movie
    }
}

// MARK: - DataSource 구현부

extension MovieListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFavorite ? data.filter{$0.isFavorite}.count : data.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieListCell.identifer
        ) as? MovieListCell
        else { return UITableViewCell() }

        let movie = isFavorite ? data.filter { $0.isFavorite }[indexPath.row] : data[indexPath.row]

        cell.configure(with: movie) { [weak self] isFavorite in
            if let index = self?.data.firstIndex(where: { $0.title == movie.title }) {
                self?.data[index].isFavorite = isFavorite
            }
        }
        return cell
    }

    override func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(
            style: .normal,
            title: nil
        ) { [weak self] action, view, completionHandler in
            self?.data[indexPath.row].isFavorite = true
            tableView.reloadRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        action.image = .init(systemName: "star.fill")
        action.backgroundColor = .systemYellow
        return .init(actions: [action])
    }

    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(
            style: .destructive,
            title: nil
        ) { [weak self] action, view, completionHandler in
            self?.data.remove(at: indexPath.row)
            tableView.reloadData()
            completionHandler(true)
        }
        action.image = .init(systemName: "trash")
        return .init(actions: [action])
    }
}
