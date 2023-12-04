import UIKit

enum CurrentCellType: Int, CaseIterable {
    case dates
    case day
    case night
    case sunMoon
    case info
}

class CurrentDayView: UIView {
    
    var forecasts: [Forecast] = []
    
    var currentParts: Parts? {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        return button
    }()
    
    lazy var detailLabel = CustomLabel(text: "Дневная погода")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: "Rubik-Medium", size: 18) ?? UIFont.systemFont(ofSize: 18)
        let textColor = UIColor.black

        let attributedString = NSMutableAttributedString(string: "Location", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 3.06
        ])
        label.attributedText = attributedString
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DateCell.self, forCellReuseIdentifier: DateCell.id)
        tableView.register(WeatherCell.self, forCellReuseIdentifier: WeatherCell.id)
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        addSubview(backButton)
        addSubview(detailLabel)
        addSubview(locationLabel)
        addSubview(tableView)
    }
        
    private func setupConstraints() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
    
    //MARK: - Update
    func update(_ forecast: [Forecast]) {
        self.forecasts = forecast
    }
}

//MARK: - Extension
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
            case .info:
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
                    
                    self.currentParts = self.forecasts[index].parts
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
                cell.titleLabel.text = "Ночь"
                return cell
                
            case .sunMoon:
                return UITableViewCell()
            case .info:
                return UITableViewCell()
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
        return 1
    }
}
