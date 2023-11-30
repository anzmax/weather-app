import UIKit

enum CellType: Int, CaseIterable {
    case current
    case hourly
    case forecast
    case daily
}

class MainScreenView: UIView {
    
    var onButtonTapped: ((IndexPath) -> Void)?

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
    
    func attributedDateString(daysToAdd: Int) -> NSAttributedString {
        let now = Date()
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd/MM"

        guard let futureDate = calendar.date(byAdding: .day, value: daysToAdd, to: now) else { return NSAttributedString() }

        let font = UIFont.rubik(.regular, size: 16)
        let textColor = UIColor.customGray

        let attributedString = NSMutableAttributedString(string: dateFormatter.string(from: futureDate), attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.16
        ])
        
        return attributedString
    }
}

extension MainScreenView: UITableViewDelegate, UITableViewDataSource {
    
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
                return cell
            case .hourly:
                let cell = tableView.dequeueReusableCell(withIdentifier: HourlyCell.id, for: indexPath) as! HourlyCell
                cell.selectionStyle = .none
                return cell
            case .forecast:
                let cell = tableView.dequeueReusableCell(withIdentifier: ForecastCell.id, for: indexPath) as! ForecastCell
                cell.selectionStyle = .none
                return cell
            case .daily:
                let cell = tableView.dequeueReusableCell(withIdentifier: DailyCell.id, for: indexPath) as! DailyCell
                cell.selectionStyle = .none
                cell.dateLabel.attributedText = attributedDateString(daysToAdd: indexPath.row)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return CellType.allCases.count
    }
    
}

