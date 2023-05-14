//
//  SectionFooterCountriesList.swift
//  Geographic atlas
//
//  Created by Aruzhan Boranbay on 12.05.2023.
//

import UIKit

class SectionFooterCountriesList: UITableViewHeaderFooterView {
    var outputDetail: (() -> Void)?
    
    weak var navigationController: UINavigationController?
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Learn more"
        label.textColor = .blue
        
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveToVC)))
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func moveToVC() {
//        guard let navigationController = self.navigationController else {
//            return
//        }
//
//        let vc = CountryDetailsViewController()
//        navigationController.pushViewController(vc, animated: true)
//        print("hello")
        outputDetail?()
    }
}

//MARK: - setUpViews and setUpConstraints
extension SectionFooterCountriesList {
    func setUpViews(){
        contentView.addSubview(label)
    }
    
    func setUpConstraints() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(14)
        }
    }
    
}
