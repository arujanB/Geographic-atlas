//
//  InfoTableViewCell.swift
//  Geographic atlas
//
//  Created by Aruzhan Boranbay on 13.05.2023.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    static let IDENTIFIER = "InfoTableViewCell"
    
    private lazy var myLabel: UILabel = {
        var label = UILabel()
        label.text = "label"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUPViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: - setUpViews and setUpConstraints
extension InfoTableViewCell {
    func setUPViews(){
        contentView.addSubview(myLabel)
    }
    
    func setUpConstraints() {
        myLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(22)
        }
    }
}
