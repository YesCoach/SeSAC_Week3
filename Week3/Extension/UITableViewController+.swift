//
//  UITableViewController+.swift
//  Week3
//
//  Created by 박태현 on 2023/07/27.
//

import UIKit

extension UITableViewController {
    func showAlert() {
        let alert = UIAlertController(
            title: "title",
            message: "message",
            preferredStyle: .alert
        )
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)

        present(alert, animated: true)
    }
}
