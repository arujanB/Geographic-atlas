//
//  ViewController.swift
//  Geographic atlas
//
//  Created by Aruzhan Boranbay on 12.05.2023.
//

import UIKit
import SnapKit

class CountriesListViewController: UIViewController {
    
    let arraySection = ["ASIA", "EUROPE", "AMERICA"]
    
    let apiCaller = APICaller()
    var geographicData: GeographicData = []
    
    private lazy var countriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.IDENTIFIER)
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
//        tableView.backgroundColor = .clear
//        tableView.layer.cornerRadius = 10
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
        
        setNavigationTitle()
        
        apiCaller.fetchRequestMainData (completion: { [weak self] values in
            DispatchQueue.main.async {
                guard let self else { return }
                self.geographicData = values
                self.countriesTableView.reloadData()
            }
        })
        
        setUpViews()
        setUpConstraints()
    }

}

//MARK: - tableView DataSource
extension CountriesListViewController: UITableViewDataSource {
    
    //section
    func numberOfSections(in tableView: UITableView) -> Int {
        return arraySection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arraySection[section]
    }
    
    //cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.IDENTIFIER, for: indexPath) as! MainTableViewCell
        cell.navigationController = self.navigationController
//        cell.backgroundColor = UIColor.init(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
        
        return cell
    }
    
    //give SPACE between the CELL in uitableview
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 8

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10
        maskLayer.masksToBounds = true
        maskLayer.backgroundColor = UIColor.init(red: 0.118, green: 0.118, blue: 0.118, alpha: 1).cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    
}

//MARK: - tableView Delegate
extension CountriesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 72
        return 212
    }
}

//MARK: - NavigationBar title
extension CountriesListViewController {
    func setNavigationTitle() {
        navigationItem.title = "World Countries"
    }
}

//MARK: - setUpViews and setUpConstraints
extension CountriesListViewController {
    func setUpViews() {
        view.addSubview(countriesTableView)
    }
    
    func setUpConstraints() {
        countriesTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(7)
        }
    }
}
