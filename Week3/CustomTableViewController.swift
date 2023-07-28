//
//  CustomTableViewController.swift
//  Week3
//
//  Created by 박태현 on 2023/07/28.
//

import UIKit

final class CustomTableViewController: UITableViewController {

    private var data = [
        Todo(main: "장보기", sub: "23.07.03", like: false, done: false),
        Todo(main: "영화보기", sub: "23.07.30", like: false, done: true),
        Todo(main: "잠자기", sub: "23.07.13", like: true, done: true)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

private extension CustomTableViewController {
    func configureUI() {
        tableView.rowHeight = 80
    }
}

// MARK: - DataSource 구현부

extension CustomTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "CustomTableViewCell"
        ) as? CustomTableViewCell else { return UITableViewCell() }

        cell.configure(with: data[indexPath.row])

        return cell
    }
}

// MARK: - Delegate 구현부

extension CustomTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
