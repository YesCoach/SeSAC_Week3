//
//  UILabel+.swift
//  Week3
//
//  Created by 박태현 on 2023/07/27.
//

import UIKit

extension UILabel {
    func configureKakaoSettingText() {
        self.font = .systemFont(ofSize: 14, weight: .light)
        self.textColor = .label
    }

    func configureTitleText() {
        self.font = .boldSystemFont(ofSize: 20)
        self.textColor = .red
        self.textAlignment = .center
    }
}
