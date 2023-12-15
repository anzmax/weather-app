import UIKit

class WeatherCell: UITableViewCell {
    
    static let id = "WeatherCell"
    
    lazy var tempLabel = RegularLabel(text: "13°", color: .customBlack, size: 30)
    lazy var conditionLabel = MediumLabel(text: "Ливни", color: .customBlack, size: 18)
    lazy var titleLabel = RegularLabel(text: "День", color: .customBlack, size: 18)
    
    lazy var feelsLikeLabel = RegularLabel(text: "По ощущениям", color: .customBlack, size: 14)
    lazy var windLabel = RegularLabel(text: "Ветер", color: .customBlack, size: 14)
    lazy var uvIndexLabel = RegularLabel(text: "УФ индекс", color: .customBlack, size: 14)
    lazy var rainChanceLabel = RegularLabel(text: "Осадки", color: .customBlack, size: 14)
    lazy var cloudinessLabel = RegularLabel(text: "Облачность", color: .customBlack, size: 14)
    
    lazy var currentImageView = CustomImageView(named: "precIcon")
    lazy var feelsLikeImageView = CustomImageView(named: "feelsLike")
    lazy var windImageView = CustomImageView(named: "wind")
    lazy var uvIndexImageView = CustomImageView(named: "sun")
    lazy var rainImageView = CustomImageView(named: "precIcon")
    lazy var cloudinessImageView = CustomImageView(named: "cloudness")
    
    lazy var feelsLikePercentageLabel = RegularLabel(text: "13°", color: .customBlack, size: 18)
    lazy var speedLabel = RegularLabel(text: "5 m\\s ЗЮЗ", color: .customBlack, size: 18)
    lazy var uvNumberLabel = RegularLabel(text: "4( умерен.)", color: .customBlack, size: 18)
    lazy var rainPercentageLabel = RegularLabel(text: "55%", color: .customBlack, size: 18)
    lazy var cloudPercentageLabel = RegularLabel(text: "72%", color: .customBlack, size: 18)
    
    lazy var feelsLikeSeparator = createSeparator()
    lazy var windSeparator = createSeparator()
    lazy var uvIndexSeparator = createSeparator()
    lazy var rainSeparator = createSeparator()
    lazy var cloudinessSeparator = createSeparator()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Update
    func update(with day: Day) {
        if let weatherCondition = WeatherCondition(rawValue: day.condition) {
            conditionLabel.text = "\(weatherCondition.ruDescription)"
        } else {
            conditionLabel.text = "Состояние погоды неизвестно"
        }
        tempLabel.text = "\(day.temp ?? 0)"
        feelsLikePercentageLabel.text = "\(day.feelsLike)°"
        speedLabel.text = "\(day.windSpeed) m\\s ЗЮЗ"
        uvNumberLabel.text = "\(day.uvIndex ?? 0)"
        rainPercentageLabel.text = "\(day.precipitation)%"
        cloudPercentageLabel.text = "\(Int(day.cloudness))%"
        
        if let weatherCondition = WeatherCondition(rawValue: day.condition) {
            currentImageView.image = imageForWeatherCondition(weatherCondition)
        } else {
            currentImageView.image = UIImage(named: "sun")
        }
    }
 }

//MARK: - Layout
extension WeatherCell {
    private func setupViews() {
        contentView.backgroundColor = .customLightBlue
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        [titleLabel, tempLabel, currentImageView, conditionLabel, feelsLikeImageView, windImageView, uvIndexImageView, rainImageView, cloudinessImageView, feelsLikeLabel, windLabel, uvIndexLabel, rainChanceLabel, cloudinessLabel, feelsLikePercentageLabel, speedLabel, uvNumberLabel, rainPercentageLabel, cloudPercentageLabel, feelsLikeSeparator, windSeparator, uvIndexSeparator, rainSeparator, cloudinessSeparator].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        setupSeparatorConstraints(separator: feelsLikeSeparator, belowView: feelsLikeLabel)
        setupSeparatorConstraints(separator: windSeparator, belowView: windLabel)
        setupSeparatorConstraints(separator: uvIndexSeparator, belowView: uvIndexLabel)
        setupSeparatorConstraints(separator: rainSeparator, belowView: rainChanceLabel)
        setupSeparatorConstraints(separator: cloudinessSeparator, belowView: cloudinessLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -284),
            
            tempLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 32),
            tempLabel.heightAnchor.constraint(equalToConstant: 36),
            tempLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 170),
            tempLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            
            currentImageView.widthAnchor.constraint(equalToConstant: 30),
            currentImageView.heightAnchor.constraint(equalToConstant: 30),
            currentImageView.trailingAnchor.constraint(equalTo: tempLabel.leadingAnchor, constant: -5),
            currentImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
            
            conditionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            conditionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 62),
            
            feelsLikeImageView.widthAnchor.constraint(equalToConstant: 20),
            feelsLikeImageView.heightAnchor.constraint(equalToConstant: 22),
            feelsLikeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            feelsLikeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 109),
            
            windImageView.widthAnchor.constraint(equalToConstant: 24),
            windImageView.heightAnchor.constraint(equalToConstant: 14),
            windImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            windImageView.topAnchor.constraint(equalTo: feelsLikeImageView.bottomAnchor, constant: 26),
            
            uvIndexImageView.widthAnchor.constraint(equalToConstant: 24),
            uvIndexImageView.heightAnchor.constraint(equalToConstant: 27),
            uvIndexImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            uvIndexImageView.topAnchor.constraint(equalTo: windImageView.bottomAnchor, constant: 25),
            
            rainImageView.widthAnchor.constraint(equalToConstant: 24),
            rainImageView.heightAnchor.constraint(equalToConstant: 30),
            rainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            rainImageView.topAnchor.constraint(equalTo: uvIndexImageView.bottomAnchor, constant: 18),
            
            cloudinessImageView.widthAnchor.constraint(equalToConstant: 24),
            cloudinessImageView.heightAnchor.constraint(equalToConstant: 17),
            cloudinessImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            cloudinessImageView.topAnchor.constraint(equalTo: rainImageView.bottomAnchor, constant: 22),
            
            feelsLikeLabel.leadingAnchor.constraint(equalTo: feelsLikeImageView.trailingAnchor, constant: 15),
            feelsLikeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 112),
            
            windLabel.leadingAnchor.constraint(equalTo: windImageView.trailingAnchor, constant: 15),
            windLabel.topAnchor.constraint(equalTo: feelsLikeLabel.bottomAnchor, constant: 27),

            uvIndexLabel.leadingAnchor.constraint(equalTo: uvIndexImageView.trailingAnchor, constant: 15),
            uvIndexLabel.topAnchor.constraint(equalTo: windLabel.bottomAnchor, constant: 27),
            
            rainChanceLabel.leadingAnchor.constraint(equalTo: rainImageView.trailingAnchor, constant: 15),
            rainChanceLabel.topAnchor.constraint(equalTo: uvIndexLabel.bottomAnchor, constant: 27),
            
            cloudinessLabel.leadingAnchor.constraint(equalTo: cloudinessImageView.trailingAnchor, constant: 15),
            cloudinessLabel.topAnchor.constraint(equalTo: rainChanceLabel.bottomAnchor, constant: 30),
            
            feelsLikePercentageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 112),
            feelsLikePercentageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            speedLabel.topAnchor.constraint(equalTo: feelsLikePercentageLabel.bottomAnchor, constant: 24),
            speedLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            uvNumberLabel.topAnchor.constraint(equalTo: speedLabel.bottomAnchor, constant: 24),
            uvNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            rainPercentageLabel.topAnchor.constraint(equalTo: uvNumberLabel.bottomAnchor, constant: 24),
            rainPercentageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            cloudPercentageLabel.topAnchor.constraint(equalTo: rainPercentageLabel.bottomAnchor, constant: 24),
            cloudPercentageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
    
    private func createSeparator() -> UIView {
         let separator = UIView()
         separator.backgroundColor = UIColor.customDarkBlue
         return separator
     }

     private func setupSeparatorConstraints(separator: UIView, belowView: UIView) {
         NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 0.5),
             separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             separator.topAnchor.constraint(equalTo: belowView.bottomAnchor, constant: 8)
         ])
     }
}
