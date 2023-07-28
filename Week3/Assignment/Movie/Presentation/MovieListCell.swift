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
