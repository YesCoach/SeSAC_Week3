//
//  CustomTableViewCell.swift
//  Week3
//
//  Created by 박태현 on 2023/07/28.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"

    @IBOutlet var backView: UIView!
    @IBOutlet var leadingImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var likeButton: UIButton!

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        subTitleLabel.text = ""
        likeButton.isSelected = false
        leadingImageView.image = nil
    }
}

extension CustomTableViewCell {
    func configure(with item: Todo) {
        titleLabel.text = item.main
        subTitleLabel.text = item.sub

        leadingImageView.image = item.done ?
            .init(systemName: "checkmark.square") : .init(systemName: "checkmark.square.fill")
        likeButton.setImage(.init(systemName: "star"), for: .normal)
        likeButton.setImage(.init(systemName: "star.fill"), for: .selected)
        likeButton.isSelected = item.like
        selectionStyle = .none
    }
}
