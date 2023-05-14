//
//  MainTableViewCell.swift
//  Geographic atlas
//
//  Created by Aruzhan Boranbay on 12.05.2023.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let IDENTIFIER = "MainTableViewCell"
    
    weak var navigationController: UINavigationController?
    
    private lazy var infoTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.IDENTIFIER)
        tableView.backgroundColor = UIColor.init(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = 0
        tableView.layer.cornerRadius = 15
        tableView.layer.masksToBounds = true
        
        return tableView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        infoTableView.dataSource = self
        infoTableView.delegate = self
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - tableView DataSource
extension MainTableViewCell: UITableViewDataSource {
    
    //section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.IDENTIFIER, for: indexPath) as! DetailTableViewCell
        return cell
    }
    
}

//MARK: - tableView Delegate
extension MainTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77 // 72
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionHeaderCountriesList()
        
        view.getToggleIcon()
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UITableView()
//        view.backgroundColor = UIColor.init(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
//        let label: UILabel = {
//            let label = UILabel()
//            label.font = UIFont.boldSystemFont(ofSize: 17)
//            label.text = "Learn more"
//            label.textColor = .blue
//            return label
//        }()
//
//        view.addSubview(label)
//        label.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.top.bottom.equalToSuperview().inset(14)
//        }
//
//        return view
        
        let view = SectionFooterCountriesList()
        view.navigationController = self.navigationController
        
        view.outputDetail = {
            guard let navigationController = self.navigationController else {
                return
            }

            let vc = CountryDetailsViewController()
            navigationController.pushViewController(vc, animated: true)
            print("Tapped")
        }
        
        return view
    }
    
}

//MARK: - setUpViews and setUpConstraints
extension MainTableViewCell {
    func setUpViews() {
        contentView.addSubview(infoTableView)
    }
    
    func setUpConstraints() {
        infoTableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalToSuperview()
//            make.leading.trailing.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(12)
        }
    }
}
