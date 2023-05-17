//
//  ViewController.swift
//  Geographic atlas
//
//  Created by Aruzhan Boranbay on 12.05.2023.
//

import UIKit
import SnapKit

class CountriesListViewController: UIViewController {
    
    let apiCaller = APICaller()
    
    //all data
    var geographicData: GeographicData = []
    var moveVCModelData: GeographicDatum?
    
    //expanded
    var expandedGeographicData: [ExpendedModelDatum] = []
    
    //sectionNames
    var regionArraySet: Set<String> = []
    var sectionArray: [String] = []
    
    //each section data
    var europeArray: [ExpendedModelDatum] = []
    var asiaArray: [ExpendedModelDatum] = []
    var africaArray: [ExpendedModelDatum] = []
    var oceaniaArray: [ExpendedModelDatum] = []
    var americasArray: [ExpendedModelDatum] = []
    var antarcticArray: [ExpendedModelDatum] = []
    
    private lazy var countriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CountriesLisTableViewCell.self, forCellReuseIdentifier: CountriesLisTableViewCell.IDENTIFIER)
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
                
                self.expandedGeographicData = values.map {
                    ExpendedModelDatum(geographicModel: $0, isExpended: false)
                }
                
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
        for i in expandedGeographicData {
            print(i.geographicModel.region)
            regionArraySet.insert(i.geographicModel.region)
            print(regionArraySet)
            
            //divied data for each section
            if i.geographicModel.region == "Europe" {
                europeArray.append(i)
            }else if i.geographicModel.region == "Asia" {
                asiaArray.append(i)
            }else if i.geographicModel.region == "Africa" {
                africaArray.append(i)
            }else if i.geographicModel.region == "Oceania" {
                oceaniaArray.append(i)
            }else if i.geographicModel.region == "Americas" {
                americasArray.append(i)
            }else if i.geographicModel.region == "Antarctic" {
                antarcticArray.append(i)
            }
        }

        print(regionArraySet)

        for j in regionArraySet {
            sectionArray.append(j)
            print(sectionArray)
        }
        
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray[section]
    }
    
    //cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sectionArray[section] == "Europe" {
            return europeArray.count
        }else if sectionArray[section] == "Asia" {
            return asiaArray.count
        }else if sectionArray[section] == "Africa" {
            return africaArray.count
        }else if sectionArray[section] == "Oceania" {
            return oceaniaArray.count
        }else if sectionArray[section] == "Americas" {
            return americasArray.count
        }else if sectionArray[section] == "Antarctic" {
            return antarcticArray.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountriesLisTableViewCell.IDENTIFIER, for: indexPath) as! CountriesLisTableViewCell
        cell.navigationController = self.navigationController
        
        if sectionArray[indexPath.section] == "Europe" {
            cell.setData(with: europeArray[indexPath.row])
            
            cell.outputDetail = {
                guard let navigationController = self.navigationController else {
                    return
                }

                self.apiCaller.fetchRequestOneData(completion: { values in
                    DispatchQueue.main.async {
                        let vc = CountryDetailsViewController(geographicDataOfOneModel: self.europeArray[indexPath.row].geographicModel)
                        navigationController.pushViewController(vc, animated: true)
                        print("Tapped cell")
                    }
                }, tld: self.europeArray[indexPath.row].geographicModel.tld![0] )
            }
        }else if sectionArray[indexPath.section] == "Asia" {
            cell.setData(with: asiaArray[indexPath.row])
            cell.outputDetail = {
                guard let navigationController = self.navigationController else {
                    return
                }

                self.apiCaller.fetchRequestOneData(completion: { values in
                    DispatchQueue.main.async {
                        let vc = CountryDetailsViewController(geographicDataOfOneModel: self.asiaArray[indexPath.row].geographicModel)
                        navigationController.pushViewController(vc, animated: true)
                        print("Tapped cell")
                    }
                }, tld: self.asiaArray[indexPath.row].geographicModel.tld![0] )
            }
        }else if sectionArray[indexPath.section] == "Africa" {
            cell.setData(with: africaArray[indexPath.row])
            cell.outputDetail = {
                guard let navigationController = self.navigationController else {
                    return
                }

                self.apiCaller.fetchRequestOneData(completion: { values in
                    DispatchQueue.main.async {
                        let vc = CountryDetailsViewController(geographicDataOfOneModel: self.africaArray[indexPath.row].geographicModel)
                        navigationController.pushViewController(vc, animated: true)
                        print("Tapped cell")
                    }
                }, tld: self.africaArray[indexPath.row].geographicModel.tld![0] )
            }
        }else if sectionArray[indexPath.section] == "Oceania" {
            cell.setData(with: oceaniaArray[indexPath.row])
            cell.outputDetail = {
                guard let navigationController = self.navigationController else {
                    return
                }

                self.apiCaller.fetchRequestOneData(completion: { values in
                    DispatchQueue.main.async {
                        let vc = CountryDetailsViewController(geographicDataOfOneModel: self.oceaniaArray[indexPath.row].geographicModel)
                        navigationController.pushViewController(vc, animated: true)
                        print("Tapped cell")
                    }
                }, tld: self.oceaniaArray[indexPath.row].geographicModel.tld![0] )
            }
        }else if sectionArray[indexPath.section] == "Americas" {
            cell.setData(with: americasArray[indexPath.row])
            cell.outputDetail = {
                guard let navigationController = self.navigationController else {
                    return
                }

                self.apiCaller.fetchRequestOneData(completion: { values in
                    DispatchQueue.main.async {
                        let vc = CountryDetailsViewController(geographicDataOfOneModel: self.americasArray[indexPath.row].geographicModel)
                        navigationController.pushViewController(vc, animated: true)
                        print("Tapped cell")
                    }
                }, tld: self.americasArray[indexPath.row].geographicModel.tld![0] )
            }
        }else if sectionArray[indexPath.section] == "Antarctic" {
            cell.setData(with: antarcticArray[indexPath.row])
            cell.outputDetail = {
                guard let navigationController = self.navigationController else {
                    return
                }

                self.apiCaller.fetchRequestOneData(completion: { values in
                    DispatchQueue.main.async {
                        let vc = CountryDetailsViewController(geographicDataOfOneModel: self.antarcticArray[indexPath.row].geographicModel)
                        navigationController.pushViewController(vc, animated: true)
                        print("Tapped cell")
                    }
                }, tld: self.antarcticArray[indexPath.row].geographicModel.tld![0] )
            }
        }
        
/////////////////////////////////////
        
//        cell.outputDetail = {
//            guard let navigationController = self.navigationController else {
//                return
//            }
//
//            self.apiCaller.fetchRequestOneData(completion: { values in
//                DispatchQueue.main.async {
//                    let vc = CountryDetailsViewController(geographicDataOfOneModel: self.geographicData[indexPath.row])
//                    navigationController.pushViewController(vc, animated: true)
//                    print("Tapped cell")
//                }
//            }, tld: self.geographicData[indexPath.row].tld![0] )
//        }
        
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
        return UITableView.automaticDimension
//        return 212
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        guard let cell = tableView.cellForRow(at: indexPath) as? CountriesLisTableViewCell else {
//            return
//        }
//
//        UIView.animate(withDuration: 0.3) {
//            self.countriesTableView.performBatchUpdates(nil)
//        }
        
        expandedGeographicData[indexPath.row].isExpended.toggle()
        countriesTableView.reloadRows(at: [indexPath], with: .automatic)
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
