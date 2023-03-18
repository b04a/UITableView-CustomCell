//
//  TableViewCell.swift
//  UITableViewTest
//
//  Created by Danil Bochkarev on 18.03.2023.
//

import UIKit
import SnapKit

class CustomCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public properties
    let label = UILabel()
    let cycleImage = UIImageView()
}

//MARK: - Setup CustomCell for UITableViewCell
extension CustomCell {
    func initialize() {
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        
        cycleImage.clipsToBounds = true
        cycleImage.layer.cornerRadius = 50
        cycleImage.translatesAutoresizingMaskIntoConstraints = false
        cycleImage.contentMode = .scaleAspectFit
        contentView.addSubview(cycleImage)

        label.snp.makeConstraints { (make) in
           make.centerX.equalTo(contentView.snp.centerX)
           make.centerY.equalTo(contentView.snp.centerY)
           make.width.equalTo(300)
           make.height.equalTo(150)
        }
        
        cycleImage.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(20)
        }
    }
}
