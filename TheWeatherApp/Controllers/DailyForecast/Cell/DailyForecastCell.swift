import UIKit

class DailyForecastCell: UITableViewCell {
    
    static let id = "DailyForecastCell"
    
    lazy var windLabel = RegularLabel(text: "Ветер".localized, color: .customBlack, size: 14)
    lazy var cloudLabel = RegularLabel(text: "Облачность".localized, color: .customBlack, size: 14)
    lazy var windIndicatorLabel = RegularLabel(text: "2 m/s CCЗ", color: .customGray, size: 14)
    lazy var precipIndicatorLabel = RegularLabel(text: "0%", color: .customGray, size: 14)
    lazy var cloudIndicatorLabel = RegularLabel(text: "29%", color: .customGray, size: 14)
    lazy var timeLabel = RegularLabel(text: "00:00", color: .customGray, size: 14)
    lazy var moonLabel = RegularLabel(text: "Преимуществен.. По ощущению 10°", color: .customBlack, size: 14)
    lazy var precipitationLabel = RegularLabel(text: "Атмосферные осадки".localized, color: .customBlack, size: 14)
    lazy var currentDegreeLabel = MediumLabel(text: "12°", color: .customBlack, size: 18)
    
    lazy var moonImageView = CustomImageView(named: "moon")
    lazy var windImageView = CustomImageView(named: "wind")
    lazy var precipitationImageView = CustomImageView(named: "humidity")
    lazy var cloudImageView = CustomImageView(named: "cloudness")
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.attributedText = attributedDateString()
        return label
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
    func update(with hour: HourModel) {
        timeLabel.text = formattedTime(hourString: hour.hour ?? "")
        currentDegreeLabel.text = "\(hour.temp)°"
        if let weatherCondition = WeatherCondition(rawValue: hour.condition ?? "") {
            moonLabel.text = "\(weatherCondition.ruDescription). \(String(format: NSLocalizedString("По ощущению %d°", comment: "Label for feels-like temperature"), hour.feelsLike))"
        } else {
            moonLabel.text = "Состояние погоды неизвестно".localized
        }
        windIndicatorLabel.text = "\(hour.windSpeed) m/s CCS"
        precipIndicatorLabel.text = "\(hour.precipitation) %"
        cloudIndicatorLabel.text = "\(hour.cloudness) %"
    }
}

//MARK: - Layout
extension DailyForecastCell {
    private func setupViews() {
        contentView.backgroundColor = .customLightBlue
        [dateLabel, timeLabel, currentDegreeLabel, moonImageView, windImageView, precipitationImageView, cloudImageView, moonLabel, windLabel, precipitationLabel, cloudLabel, windIndicatorLabel, precipIndicatorLabel, cloudIndicatorLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.heightAnchor.constraint(equalToConstant: 22),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -113),
            
            timeLabel.widthAnchor.constraint(equalToConstant: 47),
            timeLabel.heightAnchor.constraint(equalToConstant: 19),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 45),
            
            currentDegreeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 20),
            currentDegreeLabel.heightAnchor.constraint(equalToConstant: 22),
            currentDegreeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            currentDegreeLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            
            moonImageView.widthAnchor.constraint(equalToConstant: 12),
            moonImageView.heightAnchor.constraint(equalToConstant: 12),
            moonImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 74),
            moonImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 11),
            
            windImageView.widthAnchor.constraint(equalToConstant: 14),
            windImageView.heightAnchor.constraint(equalToConstant: 10),
            windImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 74),
            windImageView.topAnchor.constraint(equalTo: moonImageView.bottomAnchor, constant: 16),
            
            precipitationImageView.widthAnchor.constraint(equalToConstant: 14),
            precipitationImageView.heightAnchor.constraint(equalToConstant: 13),
            precipitationImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 74),
            precipitationImageView.topAnchor.constraint(equalTo: windImageView.bottomAnchor, constant: 16),
            
            cloudImageView.widthAnchor.constraint(equalToConstant: 14),
            cloudImageView.heightAnchor.constraint(equalToConstant: 12),
            cloudImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 74),
            cloudImageView.topAnchor.constraint(equalTo: precipitationImageView.bottomAnchor, constant: 16),
            
            moonLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            moonLabel.widthAnchor.constraint(equalToConstant: 270),
            moonLabel.heightAnchor.constraint(equalToConstant: 19),
            moonLabel.leadingAnchor.constraint(equalTo: moonImageView.trailingAnchor, constant: 5),
            
            windLabel.topAnchor.constraint(equalTo: moonLabel.bottomAnchor, constant: 8),
            windLabel.widthAnchor.constraint(equalToConstant: 50),
            windLabel.heightAnchor.constraint(equalToConstant: 19),
            windLabel.leadingAnchor.constraint(equalTo: windImageView.trailingAnchor, constant: 5),
            
            precipitationLabel.topAnchor.constraint(equalTo: windLabel.bottomAnchor, constant: 8),
            precipitationLabel.widthAnchor.constraint(equalToConstant: 158),
            precipitationLabel.heightAnchor.constraint(equalToConstant: 19),
            precipitationLabel.leadingAnchor.constraint(equalTo: precipitationImageView.trailingAnchor, constant: 5),
            
            cloudLabel.topAnchor.constraint(equalTo: precipitationLabel.bottomAnchor, constant: 8),
            cloudLabel.widthAnchor.constraint(equalToConstant: 128),
            cloudLabel.heightAnchor.constraint(equalToConstant: 16),
            cloudLabel.leadingAnchor.constraint(equalTo: cloudImageView.trailingAnchor, constant: 5),
            
            windIndicatorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            windIndicatorLabel.topAnchor.constraint(equalTo: moonLabel.bottomAnchor, constant: 8),
            
            precipIndicatorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            precipIndicatorLabel.topAnchor.constraint(equalTo: windIndicatorLabel.bottomAnchor, constant: 14),
            
            cloudIndicatorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            cloudIndicatorLabel.topAnchor.constraint(equalTo: precipIndicatorLabel.bottomAnchor, constant: 8)
        ])
    }
}
