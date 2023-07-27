//
//  AppSettingViewController.swift
//  Week3
//
//  Created by 박태현 on 2023/07/27.
//

import UIKit

final class AppSettingViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - DataSource 구현부

extension AppSettingViewController {
    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        return Setting(rawValue: section)?.description
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Setting.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Setting(rawValue: section)?.count ?? 0
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        var description: String

        guard let cell = tableView.dequeueReusableCell(withIdentifier: Setting.cellIdentifer)
        else {
            return UITableViewCell()
        }
        guard let category = Setting(rawValue: section) else {
            return UITableViewCell()
        }
        switch category {
        case .whole:
            description = Setting.Whole.allCases[row].description
        case .personal:
            description = Setting.Personal.allCases[row].description
        case .etc:
            description = Setting.Etc.allCases[row].description
        }

        cell.textLabel?.text = description
        cell.textLabel?.configureKakaoSettingText()

        return cell
    }
}
