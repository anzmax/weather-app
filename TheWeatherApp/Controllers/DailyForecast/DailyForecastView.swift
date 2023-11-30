import UIKit

class DailyForecastView: UIView {
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        return button
    }()
    
    lazy var detailLabel = CustomLabel(text: "Прогноз на 24 часа")
    
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
        tableView.backgroundColor = .customLightBlue
        tableView.separatorColor = .customBlue
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DailyForecastCell.self, forCellReuseIdentifier: DailyForecastCell.id)
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
            
            tableView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 15),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func generateTimeSlots() -> [String] {
        var timeSlots: [String] = []
        var dateComponents = DateComponents()
        for hour in stride(from: 0, to: 24, by: 3) {
            dateComponents.hour = hour
            if let date = Calendar.current.date(from: dateComponents) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "HH:mm"
                let timeString = dateFormatter.string(from: date)
                timeSlots.append(timeString)
            }
        }
        return timeSlots
    }
}

extension DailyForecastView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generateTimeSlots().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastCell.id, for: indexPath) as! DailyForecastCell
        let timeSlots = generateTimeSlots()
        let slotIndex = indexPath.row % timeSlots.count
        cell.timeLabel.text = timeSlots[slotIndex]
        return cell
    }
}
