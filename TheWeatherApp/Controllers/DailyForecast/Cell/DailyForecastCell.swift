import UIKit

class DailyForecastCell: UITableViewCell {
    
    static let id = "DailyForecastCell"
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.attributedText = attributedDateString()
        return label
    }()
    
    func attributedDateString() -> NSAttributedString {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "E dd/MM"

        var dateString = dateFormatter.string(from: now)
        dateString = dateString.capitalizingFirstLetter()

        let font = UIFont.rubik(.medium, size: 18)

        let textColor = UIColor.customBlack

        let attributedString = NSMutableAttributedString(string: dateString, attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.16
        ])
        
        return attributedString
    }
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.rubik(.regular, size: 14)
        let textColor = UIColor.customGray
        let attributedString = NSMutableAttributedString(string: "00:00", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.14
        ])
        label.attributedText = attributedString
        return label
    }()
    
    lazy var currentDegreeLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.rubik(.medium, size: 18)
        let textColor = UIColor.customBlack

        let attributedString = NSMutableAttributedString(string: "12°", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 3.06
        ])
        
        label.attributedText = attributedString
        return label
    }()
    
    lazy var moonImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "moon")
        return view
    }()
    
    lazy var windImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "wind")
        return view
    }()
    
    lazy var precipitationImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "humidity")
        return view
    }()
    
    lazy var cloudImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "cloudness")
        return view
    }()
    
    lazy var moonLabel = CustomDescriptionLabel(text: "Преимуществен.. По ощущению 10°", color: .customBlack)
    lazy var windLabel = CustomDescriptionLabel(text: "Ветер", color: .customBlack)
    lazy var precipitationLabel = CustomDescriptionLabel(text: "Атмосферные осадки", color: .customBlack)
    lazy var cloudLabel = CustomDescriptionLabel(text: "Облачность", color: .customBlack)
    
    lazy var windIndicatorLabel = CustomDescriptionLabel(text: "2 m/s CCЗ", color: .customGray)
    lazy var precipIndicatorLabel = CustomDescriptionLabel(text: "0%", color: .customGray)
    lazy var cloudIndicatorLabel = CustomDescriptionLabel(text: "29%", color: .customGray)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.backgroundColor = .customLightBlue
        contentView.addSubview(dateLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(currentDegreeLabel)
        
        contentView.addSubview(moonImageView)
        contentView.addSubview(windImageView)
        contentView.addSubview(precipitationImageView)
        contentView.addSubview(cloudImageView)
        
        contentView.addSubview(moonLabel)
        contentView.addSubview(windLabel)
        contentView.addSubview(precipitationLabel)
        contentView.addSubview(cloudLabel)
        
        contentView.addSubview(windIndicatorLabel)
        contentView.addSubview(precipIndicatorLabel)
        contentView.addSubview(cloudIndicatorLabel)
    }
        
    private func setupConstraints() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        currentDegreeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        moonImageView.translatesAutoresizingMaskIntoConstraints = false
        windImageView.translatesAutoresizingMaskIntoConstraints = false
        precipitationImageView.translatesAutoresizingMaskIntoConstraints = false
        cloudImageView.translatesAutoresizingMaskIntoConstraints = false
        
        moonLabel.translatesAutoresizingMaskIntoConstraints = false
        windLabel.translatesAutoresizingMaskIntoConstraints = false
        precipitationLabel.translatesAutoresizingMaskIntoConstraints = false
        cloudLabel.translatesAutoresizingMaskIntoConstraints = false
        
        windIndicatorLabel.translatesAutoresizingMaskIntoConstraints = false
        precipIndicatorLabel.translatesAutoresizingMaskIntoConstraints = false
        cloudIndicatorLabel.translatesAutoresizingMaskIntoConstraints = false
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
    
    //MARK: - Update
    func update(with hour: Hour) {
        timeLabel.text = formattedTime(hourString: hour.hour)
        currentDegreeLabel.text = "\(hour.temp)°"
        if let weatherCondition = WeatherCondition(rawValue: hour.condition) {
            moonLabel.text = "\(weatherCondition.ruDescription). По ощущению \(hour.feelsLike)°"
        } else {
            moonLabel.text = "Состояние погоды неизвестно"
        }
        windIndicatorLabel.text = "\(hour.windSpeed) m/s CCS"
        precipIndicatorLabel.text = "\(hour.precipitation) %"
        cloudIndicatorLabel.text = "\(hour.cloudness) %"
    }
}
