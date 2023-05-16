//
//  InfoTableViewCell.swift
//  Geographic atlas
//
//  Created by Aruzhan Boranbay on 13.05.2023.
//

import UIKit

class CountryDetailsTableViewCell: UITableViewCell {
    static let IDENTIFIER = "CountryDetailsTableViewCell"
    
    private lazy var cellData: UILabel = label(with: "Region")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUPViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func label(with text: String) -> UILabel {
        var label = UILabel()
        label.text = text
        return label
    }
    
    func setData(with text: String) {
        cellData.text = text
    }
}

//MARK: - setUpViews and setUpConstraints
extension CountryDetailsTableViewCell {
    func setUPViews(){
        contentView.addSubview(cellData)
    }
    
    func setUpConstraints() {
        cellData.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(22)
        }
    }
}
