import UIKit

final class CurrentCell: UITableViewCell {
    
    static let id = "CurrentCell"
    
    var buttonAction: (() -> Void)?
    
    lazy var mainView = CustomView(backgroundColor: .customBlue, cornerRadius: 5)
    
    lazy var sunriseImageView = CustomImageView(named: "sunrise")
    lazy var sunsetImageView = CustomImageView(named: "sunset")
    lazy var ellipseImageView = CustomImageView(named: "ellipse")
    lazy var cloudImageView = CustomImageView(named: "cloudSun")
    lazy var windImageView = CustomImageView(named: "windWhite")
    lazy var humidityImageView = CustomImageView(named: "humidityWhite")
    
    lazy var cloudLabel = RegularLabel(text: "0", color: .white, size: 14)
    lazy var windLabel = RegularLabel(text: "3 м/с", color: .white, size: 14)
    lazy var humidityLabel = RegularLabel(text: "75%", color: .white, size: 14)
    lazy var degreeRangeLabel = RegularLabel(text: "7°/13°", color: .white, size: 16)
    lazy var descriptionLabel = RegularLabel(text: "Возможен небольшой дождь", color: .white, size: 16)
    
    lazy var sunriseTimeLabel = MediumLabel(text: "05:41", color: .white, size: 14)
    lazy var sunsetTimeLabel = MediumLabel(text: "19:31", color: .white, size: 14)
    lazy var degreeLabel = MediumLabel(text: "13°", color: .white, size: 36)
    
    lazy var currentDayTimeLabel: UILabel = {
        let label = UILabel()
        label.attributedText = attributedCurrentDateTime()
        return label
    }()
    
    lazy var detailButton: UIButton = {
        let button = UIButton()
        let titleString = "Подробнее на 24 часа"
        let attributedTitle = NSMutableAttributedString(string: titleString)
        if let rubikFont = UIFont(name: "Rubik-Regular", size: 16) {
            attributedTitle.addAttribute(.font, value: rubikFont, range: NSRange(location: 0, length: titleString.count))
        }
        attributedTitle.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: titleString.count))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.setTitleColor(.customBlack, for: .normal)
        button.addTarget(self, action: #selector(detailButtonPressed), for: .touchUpInside)
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
    func update(with weather: Weather) {
        let tempMin = weather.forecasts[0].parts.dayShort.temp ?? 0
        let tempMax = weather.forecasts[0].parts.nightShort.temp ?? 0
        
        if let weatherCondition = WeatherCondition(rawValue: weather.fact.condition) {
            descriptionLabel.text = weatherCondition.ruDescription
        } else {
            descriptionLabel.text = "Неизвестно"
        }
        sunriseTimeLabel.text = "\(weather.forecasts[0].riseBegin)"
        sunsetTimeLabel.text = "\(weather.forecasts[0].setEnd)"
        degreeLabel.text = "\(weather.fact.temp)°"
        cloudLabel.text = "\(weather.fact.cloudness)%"
        windLabel.text = "\(weather.fact.windSpeed) м/с"
        humidityLabel.text = "\(weather.fact.humidity)%"
        degreeRangeLabel.text = "\(tempMin)° /\(tempMax)°"
    }
    
    @objc func detailButtonPressed() {
        buttonAction?()
    }
}

//MARK: - Layout
extension CurrentCell {
    private func setupViews() {
        [mainView, detailButton].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        [sunriseTimeLabel, sunsetTimeLabel, sunriseImageView, sunsetImageView, ellipseImageView, degreeRangeLabel, degreeLabel, descriptionLabel, cloudImageView, windImageView, humidityImageView, cloudLabel, windLabel, humidityLabel, currentDayTimeLabel].forEach {
            mainView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.heightAnchor.constraint(equalToConstant: 212),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            detailButton.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 33),
            detailButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 170),
            detailButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            sunriseTimeLabel.heightAnchor.constraint(equalToConstant: 19),
            sunriseTimeLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 17),
            sunriseTimeLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 167),
            
            sunsetTimeLabel.heightAnchor.constraint(equalToConstant: 19),
            sunsetTimeLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -17),
            sunsetTimeLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 167),
            
            sunriseImageView.heightAnchor.constraint(equalToConstant: 17),
            sunriseImageView.widthAnchor.constraint(equalToConstant: 17),
            sunriseImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 25),
            sunriseImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 145),
            
            sunsetImageView.heightAnchor.constraint(equalToConstant: 17),
            sunsetImageView.widthAnchor.constraint(equalToConstant: 17),
            sunsetImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -25),
            sunsetImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 145),
            
            ellipseImageView.heightAnchor.constraint(equalToConstant: 246),
            ellipseImageView.widthAnchor.constraint(equalToConstant: 296),
            ellipseImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 17),
            ellipseImageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -73),
            ellipseImageView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            
            degreeRangeLabel.heightAnchor.constraint(equalToConstant: 20),
            degreeRangeLabel.widthAnchor.constraint(equalToConstant: 70),
            degreeRangeLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            degreeRangeLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 33),
            
            degreeLabel.heightAnchor.constraint(equalToConstant: 40),
            degreeLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            degreeLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 58),
            
            descriptionLabel.heightAnchor.constraint(equalToConstant: 20),
            descriptionLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 103),
            descriptionLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            
            cloudImageView.heightAnchor.constraint(equalToConstant: 18),
            cloudImageView.widthAnchor.constraint(equalToConstant: 23),
            cloudImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 138),
            cloudImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 70),
            
            windImageView.heightAnchor.constraint(equalToConstant: 18),
            windImageView.widthAnchor.constraint(equalToConstant: 25),
            windImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 140),
            windImageView.leadingAnchor.constraint(equalTo: cloudLabel.trailingAnchor, constant: 20),
            
            humidityImageView.heightAnchor.constraint(equalToConstant: 15),
            humidityImageView.widthAnchor.constraint(equalToConstant: 13),
            humidityImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 139),
            humidityImageView.leadingAnchor.constraint(equalTo: windLabel.trailingAnchor, constant: 20),
            
            cloudLabel.heightAnchor.constraint(equalToConstant: 18),
            cloudLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 138),
            cloudLabel.leadingAnchor.constraint(equalTo: cloudImageView.trailingAnchor, constant: 5),
            
            windLabel.heightAnchor.constraint(equalToConstant: 18),
            windLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 138),
            windLabel.leadingAnchor.constraint(equalTo: windImageView.trailingAnchor, constant: 5),
            
            humidityLabel.heightAnchor.constraint(equalToConstant: 18),
            humidityLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 138),
            humidityLabel.leadingAnchor.constraint(equalTo: humidityImageView.trailingAnchor, constant: 5),
            
            currentDayTimeLabel.heightAnchor.constraint(equalToConstant: 20),
            currentDayTimeLabel.widthAnchor.constraint(equalToConstant: 158),
            currentDayTimeLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 171),
            currentDayTimeLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor)
        ])
    }
}
