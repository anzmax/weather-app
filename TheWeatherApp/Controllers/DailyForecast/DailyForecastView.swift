import UIKit

class DailyForecastView: UIView {
    
    var hours: [Hour] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var detailLabel = RegularLabel(text: "Прогноз на 24 часа", color: .customGray, size: 16)
    lazy var locationLabel = MediumLabel(text: "Location", color: .customBlack, size: 18)
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        return button
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
            
            tableView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 15),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    //MARK: - Update
    func updateHour(_ hours: [Hour]) {
        var result: [Hour] = []
        for (index, hour) in hours.enumerated() {
            if index % 3 == 0 {
                result.append(hour)
            }
        }
        self.hours = result
    }
}

//MARK: - Extension
extension DailyForecastView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        hours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastCell.id, for: indexPath) as! DailyForecastCell
        let hour = hours[indexPath.row]
        cell.update(with: hour)
        return cell
    }
}
