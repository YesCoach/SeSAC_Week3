//
//  CustomTableViewCell.swift
//  Week3
//
//  Created by 박태현 on 2023/07/28.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    @IBOutlet var backView: UIView!
    @IBOutlet var leadingImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
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
