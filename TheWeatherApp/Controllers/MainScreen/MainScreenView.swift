import UIKit

enum CellType: Int, CaseIterable {
    case current
    case hourly
    case forecast
    case daily
}

class MainScreenView: UIView {
    
    var onButtonTapped: ((IndexPath) -> Void)?
    var actionButtonTapped: ((IndexPath) -> Void)?
    
    var weather: Weather?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CurrentCell.self, forCellReuseIdentifier: CurrentCell.id)
        tableView.register(HourlyCell.self, forCellReuseIdentifier: HourlyCell.id)
        tableView.register(ForecastCell.self, forCellReuseIdentifier: ForecastCell.id)
        tableView.register(DailyCell.self, forCellReuseIdentifier: DailyCell.id)
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 112),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}

//MARK: - Extensions
extension MainScreenView {
    func update(_ weather: Weather) {
        self.weather = weather
    }
}

extension MainScreenView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return CellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sectionType = CellType.init(rawValue: section) {
            switch sectionType {
            case .current:
                return 1
            case .hourly:
                return 1
            case .forecast:
                return 1
            case .daily:
                return 7
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let sectionType = CellType(rawValue: indexPath.section) {
            switch sectionType {
            case .current:
                let cell = tableView.dequeueReusableCell(withIdentifier: CurrentCell.id, for: indexPath) as! CurrentCell
                cell.selectionStyle = .none
                cell.buttonAction = { [weak self] in
                    self?.onButtonTapped?(indexPath)
                }
                
                if let weather {
                    cell.update(with: weather)
                }
                return cell
            case .hourly:
                let cell = tableView.dequeueReusableCell(withIdentifier: HourlyCell.id, for: indexPath) as! HourlyCell
                cell.selectionStyle = .none
                if let hours = weather?.forecasts[0].hours {
                    cell.update(hours)
                }
                return cell
            case .forecast:
                let cell = tableView.dequeueReusableCell(withIdentifier: ForecastCell.id, for: indexPath) as! ForecastCell
                cell.selectionStyle = .none
                return cell
            case .daily:
                let cell = tableView.dequeueReusableCell(withIdentifier: DailyCell.id, for: indexPath) as! DailyCell
                cell.selectionStyle = .none
                cell.action = { [weak self] in
                    self?.actionButtonTapped?(indexPath)
                }
                
                cell.dateLabel.attributedText = attributedDateString(daysToAdd: indexPath.row)
                
                if let forecast = weather?.forecasts[indexPath.row] {
                    cell.update(with: forecast)
                }

                return cell
            }
        }
        return UITableViewCell()
    }
}

