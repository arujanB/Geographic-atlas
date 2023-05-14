//
//  CountryDetailsViewController.swift
//  Geographic atlas
//
//  Created by Aruzhan Boranbay on 12.05.2023.
//

import UIKit

class CountryDetailsViewController: UIViewController {
    private let sectionArray: [String] = ["Region: ", "Capital: ", "Capital Coordinates: ", "Population: ", "Area: ", "Currency: ", "Timezones: "]
    
    private lazy var flagImg: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "1")
        img.layer.cornerRadius = 12
        img.layer.masksToBounds = true
        
        return img
    }()
    
    private lazy var detailTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.IDENTIFIER)
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        detailTableView.dataSource = self
        detailTableView.delegate = self
        
        setNavigationTitle()
        
        setUpViews()
        setUpConstraints()
    }
    
}

//MARK: - tableView dataSource
extension CountryDetailsViewController: UITableViewDataSource {
    //section
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        tableView.backgroundColor = .orange
//
//        return sectionArray[section]
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UITableView()
        
        let label: UILabel = {
            let label = UILabel()
            label.text = sectionArray[section]
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = .gray
            
            return label
        }()
        
        let imgCircle: UIImageView = {
            let img = UIImageView()
            img.image = UIImage(named: "3")
            return img
        }()
        
        view.addSubview(label)
        view.addSubview(imgCircle)
        
        imgCircle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(4)
            make.size.equalTo(8)
        }
        
        label.snp.makeConstraints { make in
            make.leading.equalTo(imgCircle.snp.trailing).offset(8)
        }
        
        return view
    }
    
    //cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.IDENTIFIER, for: indexPath)
        return cell
    }
    
}

//MARK: - tableView delegate
extension CountryDetailsViewController: UITableViewDelegate {
    //section height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    //cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 13
    }
}

//MARK: - NavigationBar title
extension CountryDetailsViewController{
    func setNavigationTitle() {
        navigationItem.title = "Title"
    }
}

//MARK: - setUpViews and setUpConstraints
extension CountryDetailsViewController {
    func setUpViews() {
        view.addSubview(flagImg)
        view.addSubview(detailTableView)
    }
    
    func setUpConstraints() {
        flagImg.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(200)
        }
        
        detailTableView.snp.makeConstraints { make in
            make.top.equalTo(flagImg.snp.bottom).offset(12)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
