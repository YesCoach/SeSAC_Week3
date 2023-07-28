//
//  CustomTableViewController.swift
//  Week3
//
//  Created by 박태현 on 2023/07/28.
//

import UIKit

final class CustomTableViewController: UITableViewController {

    private var data = TodoInformation()

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
        return data.list.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.identifier
        ) as? CustomTableViewCell else { return UITableViewCell() }

        cell.configure(with: data.list[indexPath.row])

        return cell
    }
}

// MARK: - Delegate 구현부

extension CustomTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
