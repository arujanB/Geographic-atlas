//
//  CountriesListTableViewCell.swift
//  Geographic atlas
//
//  Created by Aruzhan Boranbay on 12.05.2023.
//

import UIKit

class SectionHeaderCountriesList: UITableViewCell {
    static let IDENTIFIER = "CountriesListTableViewCell"
    
    private lazy var flagImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = 12
        img.layer.masksToBounds = true
        img.image = UIImage(named: "1")
        return img
    }()
    
    private lazy var countryName: UILabel = {
        let label = UILabel()
        label.text = "USA"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var cityName: UILabel = {
        let label = UILabel()
        label.text = "New York"
        label.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [countryName, cityName])
        stackView.axis = .vertical
        stackView.spacing = 4
        
        return stackView
    }()
    
    private lazy var toggleIconBtn: UIButton = {
        let icon = UIButton(type: .system)
//        let img = UIImage(named: "2")
        let img = UIImage(systemName: "chevron.compact.down")
        img?.withTintColor(.black)
        
        icon.frame = CGRect(x: 0, y: 0, width: 13.5, height: 7.5)
        icon.setImage(img, for: .normal)
        
        return icon
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getToggleIcon() -> UIButton {
        return toggleIconBtn
    }
    
}

//MARK: - setUpViews and setUpConstraints
extension SectionHeaderCountriesList {
    func setUpViews() {
        contentView.addSubview(flagImg)
        contentView.addSubview(labelStackView)
        contentView.addSubview(toggleIconBtn)
    }
    
    func setUpConstraints() {
        flagImg.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(12)
            make.width.equalTo(82)
            make.height.equalTo(48)
            make.bottom.equalToSuperview().inset(12)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.leading.equalTo(flagImg.snp.trailing).offset(12)
            make.top.equalToSuperview().inset(16)
        }
        
        toggleIconBtn.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(17)
            make.top.equalToSuperview().inset(32)
        }
    }
}
