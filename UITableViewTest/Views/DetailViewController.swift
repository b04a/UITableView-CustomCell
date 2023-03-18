//
//  DetailViewController.swift
//  UITableViewTest
//
//  Created by Danil Bochkarev on 18.03.2023.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    //MARK: - Selected info
    var selectedData: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        initialize()
    }

    @objc private func backAction() {
        dismiss(animated: true, completion: nil)
    }
}

private extension DetailViewController {
    func initialize() {
        
        let label = UILabel()
        label.text = selectedData
        view.addSubview(label)

        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }

        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton
    }
}
