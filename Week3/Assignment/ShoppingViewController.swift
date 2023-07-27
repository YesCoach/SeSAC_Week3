//
//  ShoppingViewController.swift
//  Week3
//
//  Created by 박태현 on 2023/07/27.
//

import UIKit

final class ShoppingViewContorller: UITableViewController {

    @IBOutlet var tableHeaderView: UIView!
    @IBOutlet var addingTextField: UITextField!

    private let cellIdentifier = "shoppingItem"
    private var data: [String] = ["아이폰", "에어팟", "아이맥", "맥북 프로"] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(didBackgroundViewTouched(_:))
        )
        tableView.addGestureRecognizer(tapGesture)
    }

    @objc func didBackgroundViewTouched(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func didReturnKeyEntered(_ sender: UITextField) {

    }

    @IBAction func didAddButtonTouched(_ sender: UIButton) {
        view.endEditing(true)

        guard let keyword = addingTextField.text,
              keyword.isEmpty == false
        else {
            showAlert(message: "최소 한글자 이상 입력해주세요!")
            return
        }
        addingTextField.text = ""
        data.append(keyword)
    }
}

extension ShoppingViewContorller {
    func configureUI() {
        tableHeaderView.layer.cornerRadius = 10.0
        tableView.rowHeight = 60.0
    }
}

// MARK: - DataSource 구현부

extension ShoppingViewContorller {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
            fatalError("Invalid Cell")
        }
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.configureShoppingText()
        
        return cell
    }
}
