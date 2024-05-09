import UIKit

enum CurrentCellType: Int, CaseIterable {
    case dates
    case day
    case night
    case sunMoon
    case airInfo
}

class CurrentDayView: UIView {
    
    var forecasts: [ForecastModel] = []
    
    var currentParts: PartsModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var detailLabel = RegularLabel(text: "Дневная погода".localized, color: .customGray, size: 16)
    lazy var locationLabel = MediumLabel(text: "Location", color: .customBlack, size: 18)
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DateCell.self, forCellReuseIdentifier: DateCell.id)
        tableView.register(WeatherCell.self, forCellReuseIdentifier: WeatherCell.id)
        tableView.register(SunMoonCell.self, forCellReuseIdentifier: SunMoonCell.id)
        tableView.register(AirInfoCell.self, forCellReuseIdentifier: AirInfoCell.id)
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Update
    func update(_ forecast: [ForecastModel]) {
        self.forecasts = forecast
    }
}

//MARK: - Delegate
extension CurrentDayView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        CurrentCellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sectionType = CurrentCellType(rawValue: section) {
            switch sectionType {
            case .dates:
                return 1
            case .day:
                return 1
            case .night:
                return 1
            case .sunMoon:
                return 1
            case .airInfo:
                return 1
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let sectionType = CurrentCellType(rawValue: indexPath.section) {
            switch sectionType {
            case .dates:
                let cell = tableView.dequeueReusableCell(withIdentifier: DateCell.id, for: indexPath) as! DateCell
                
                cell.onDateCellTapped = { index in
                    
                    print("Index: \(index), Forecasts Count: \(self.forecasts.count)")
                    if index < self.forecasts.count {
                        self.currentParts = self.forecasts[index].parts
                    } else {
                        print("Index out of range")
                    }
                }
                return cell
                
            case .day:
                let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.id, for: indexPath) as! WeatherCell
                if let day = currentParts?.dayShort {
                    cell.update(with: day)
                }
                return cell
                
            case .night:
                let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.id, for: indexPath) as! WeatherCell
                
                if let day = currentParts?.nightShort {
                    cell.update(with: day)
                }
                cell.titleLabel.text = "Ночь".localized
                return cell
                
            case .sunMoon:
                let cell = tableView.dequeueReusableCell(withIdentifier: SunMoonCell.id, for: indexPath) as! SunMoonCell
                let forecast = forecasts[indexPath.row]
                    cell.update(with: forecast)
                return cell
            case .airInfo:
                let cell = tableView.dequeueReusableCell(withIdentifier: AirInfoCell.id, for: indexPath) as! AirInfoCell
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == CurrentCellType.night.rawValue {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
}

//MARK: - Layout
extension CurrentDayView {
    private func setupViews() {
        backgroundColor = .white
        [backButton, detailLabel, locationLabel, tableView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 15),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 72),
            
            detailLabel.widthAnchor.constraint(equalToConstant: 200),
            detailLabel.heightAnchor.constraint(equalToConstant: 20),
            detailLabel.topAnchor.constraint(equalTo: topAnchor, constant: 72),
            detailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 52),
            
            locationLabel.widthAnchor.constraint(equalToConstant: 197),
            locationLabel.heightAnchor.constraint(equalToConstant: 22),
            locationLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 15),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            tableView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
