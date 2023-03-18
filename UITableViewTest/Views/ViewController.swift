//
//  ViewController.swift
//  UITableViewTest
//
//  Created by Danil Bochkarev on 18.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        addViewConstraints()
    }
    
    //MARK: - Private properties
    private var tableView = UITableView()
}


//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        cell.label.text = "HEllo"
        cell.cycleImage.image = UIImage(named: "test")
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        if let cell = tableView.cellForRow(at: indexPath) as? CustomCell {
            vc.selectedData = cell.label.text // передаем информацию из ячейки в следующий ViewController
        }
        
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
}

extension ViewController {
    private func addViewConstraints() {
        tableView.rowHeight = 150
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
