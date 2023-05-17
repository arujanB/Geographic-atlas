import UIKit
import Kingfisher

class CountriesLisTableViewCell: UITableViewCell {
    static let IDENTIFIER = "CountriesLisTableViewCell"
    
    weak var navigationController: UINavigationController?
    
    var outputDetail: (() -> Void)?
    
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
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
//        stackView.backgroundColor = .orange
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
    
    //expended
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
    
    private lazy var expendedStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [populationLabel, areaLabel, currenciesLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.init(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveToVC)))
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func moveToVC() {
        outputDetail?()
    }
    
    func setData(with model: ExpendedModelDatum) {
        let url = URL(string: model.geographicModel.flags.png)
        flagImg.kf.setImage(with: url)
        countryName.text = model.geographicModel.name.common
        cityName.text = model.geographicModel.capital?[0]
        
        expendedStackView.isHidden = !model.isExpended
        toggleIconBtn.imageView?.image = (model.isExpended ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down"))?.withRenderingMode(.alwaysTemplate)
        
    }
    
}

//MARK: - setUpViews and setUpConstraints
extension CountriesLisTableViewCell {
    func setUpViews() {
        contentView.addSubview(flagImg)
        contentView.addSubview(labelStackView)
        contentView.addSubview(toggleIconBtn)
        contentView.addSubview(expendedStackView)
    }
    
    func setUpConstraints() {
        flagImg.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
            make.width.equalTo(82)
            make.height.equalTo(48)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.leading.equalTo(flagImg.snp.trailing).offset(12)
            make.top.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(12)
        }
        
        toggleIconBtn.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(17)
            make.top.equalToSuperview().inset(32)
        }
        
        expendedStackView.snp.makeConstraints { make in
            make.top.equalTo(flagImg.snp.bottom).offset(12)
            make.leading.equalToSuperview().inset(12)
        }
    }
}
