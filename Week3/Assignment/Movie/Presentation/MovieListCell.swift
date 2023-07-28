//
//  MovieListCell.swift
//  Week3
//
//  Created by 박태현 on 2023/07/28.
//

import UIKit

final class MovieListCell: UITableViewCell {

    static let identifer = "MovieListCell"

    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var runtimeLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
}

extension MovieListCell {
    func configure(with movie: Movie) {
        configureUI()
        posterImageView.image = .init(named: movie.posterImageName)
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
        runtimeLabel.text = "\(movie.runtime)분"
        rateLabel.text = "\(movie.rate)점"
        overviewLabel.text = movie.overview
    }
}

private extension MovieListCell {
    func configureUI() {
        selectionStyle = .none
        posterImageView.contentMode = .scaleAspectFill
        titleLabel.font = .boldSystemFont(ofSize: 20)
        [
            releaseDateLabel, runtimeLabel, rateLabel
        ].forEach {
            $0?.font = .systemFont(ofSize: 16, weight: .medium)
        }
        overviewLabel.font = .systemFont(ofSize: 13, weight: .regular)
    }
}
