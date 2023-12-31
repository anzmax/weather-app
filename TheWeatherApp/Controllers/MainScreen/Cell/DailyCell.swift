import UIKit

class DailyCell: UITableViewCell {
    
    static let id = "DailyCell"
    
    var action: (() -> Void)?
    
    lazy var mainView = CustomView(backgroundColor: .customLightBlue, cornerRadius: 5)
    lazy var weatherImageView = CustomImageView(named: "precIcon")
    
    lazy var percentageLabel = RegularLabel(text: "57%", color: .customBlue, size: 12)
    lazy var descriptionLabel = RegularLabel(text: "Местами дождь", color: .customBlack, size: 16)
    lazy var tempLabel = RegularLabel(text: "4°-11°", color: .customBlack, size: 18)
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var currentDetailButton: UIButton = {
        let button = UIButton()
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 14, weight: .light)
        let image = UIImage(systemName: "chevron.right", withConfiguration: symbolConfiguration)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(currentDetailButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Update
    func update(with forecast: ForecastModel) {
        if let weatherCondition = WeatherCondition(rawValue: forecast.parts?.dayShort?.condition ?? "") {
            descriptionLabel.text = weatherCondition.ruDescription
        } else {
            descriptionLabel.text = "Неизвестно"
        }
        percentageLabel.text = "\(forecast.parts?.dayShort?.precipitation ?? 0)%"
        let tempMin = forecast.parts?.dayShort?.tempMin ?? 0
        let temp = forecast.parts?.dayShort?.temp ?? 0
        tempLabel.text = "\(tempMin)° - \(temp)°"
    }
    
    @objc func currentDetailButtonPressed() {
        action?()
    }
}

//MARK: - Layout
extension DailyCell {
    private func setupViews() {
        contentView.addSubview(mainView)
        [dateLabel, weatherImageView, percentageLabel, descriptionLabel, tempLabel, currentDetailButton].forEach {
            mainView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            dateLabel.widthAnchor.constraint(equalToConstant: 53),
            dateLabel.heightAnchor.constraint(equalToConstant: 19),
            dateLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 6),
            dateLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -31),
            
            weatherImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 29.68),
            weatherImageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -9.24),
            weatherImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            weatherImageView.widthAnchor.constraint(equalToConstant: 15),
            weatherImageView.heightAnchor.constraint(equalToConstant: 17),
            
            percentageLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 31),
            percentageLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -9.81),
            percentageLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 30),
            percentageLabel.widthAnchor.constraint(equalToConstant: 25),
            percentageLabel.heightAnchor.constraint(equalToConstant: 15),
            
            descriptionLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 19),
            descriptionLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -18),
            descriptionLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 66),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 19),
            
            tempLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 17),
            tempLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -17.17),
            tempLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -28),
            tempLabel.heightAnchor.constraint(equalToConstant: 21.8),
            
            currentDetailButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            currentDetailButton.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        ])
    }
}
