//
//  DetailTableViewCell.swift
//  Geographic atlas
//
//  Created by Aruzhan Boranbay on 12.05.2023.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static let IDENTIFIER = "DetailTableViewCell"
    
    private lazy var populationLabel: UILabel = {
        let label = UILabel()
        label.text = "Population: 19 mln"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        return label
    }()
    
    private lazy var areaLabel: UILabel = {
        let label = UILabel()
        label.text = "Area: 19 mln km"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        return label
    }()
    
    private lazy var currenciesLabel: UILabel = {
        let label = UILabel()
        label.text = "Currencies: Tenge (T) KZT"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [populationLabel, areaLabel, currenciesLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.init(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func label(with name: String, value: Int, varable: String) -> UILabel {
        let label = UILabel()
        label.text = "\(name): \(value) \(varable)"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        
        return label
    }

}

//MARK: - setUpViews and setUpConstraints
extension DetailTableViewCell {
    func setUpViews() {
        contentView.addSubview(stackView)
    }
    
    func setUpConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
        }
    }
}
