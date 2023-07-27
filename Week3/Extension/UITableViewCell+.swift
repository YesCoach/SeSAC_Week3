//
//  UITableViewCell+.swift
//  Week3
//
//  Created by 박태현 on 2023/07/27.
//

import UIKit

extension UITableViewCell {
    func configureShoppingType() {
        self.backgroundColor = .systemGroupedBackground
        self.imageView?.image = .init(systemName: "checkmark.square")
        self.imageView?.tintColor = .black
        let accesoryView = UIImageView(frame: CGRect(origin: .zero,
                                          size: CGSize(width: 28, height: 24)))
        accesoryView.image = .init(systemName: "star.fill")
        accesoryView.tintColor = .black
        self.accessoryView = accesoryView
        self.textLabel?.configureShoppingText()
    }
}
