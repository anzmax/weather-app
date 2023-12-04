import UIKit

class WeatherCell: UITableViewCell {
    
    static let id = "WeatherCell"
    
    lazy var feelsLikeLabel = CustomDescriptionLabel(text: "По ощущениям", color: .customBlack)
    lazy var windLabel = CustomDescriptionLabel(text: "Ветер", color: .customBlack)
    lazy var uvIndexLabel = CustomDescriptionLabel(text: "УФ индекс", color: .customBlack)
    lazy var rainChanceLabel = CustomDescriptionLabel(text: "Осадки", color: .customBlack)
    lazy var cloudinessLabel = CustomDescriptionLabel(text: "Облачность", color: .customBlack)
    
    lazy var currentImageView = WeatherIconView(named: "precIcon")
    lazy var feelsLikeImageView = WeatherIconView(named: "feelsLike")
    lazy var windImageView = WeatherIconView(named: "wind")
    lazy var uvIndexImageView = WeatherIconView(named: "sun")
    lazy var rainImageView = WeatherIconView(named: "precIcon")
    lazy var cloudinessImageView = WeatherIconView(named: "cloudness")
    
    lazy var feelsLikePercentageLabel = ConditionLabel(text: "13°")
    lazy var speedLabel = ConditionLabel(text: "5 m\\s ЗЮЗ")
    lazy var uvNumberLabel = ConditionLabel(text: "4( умерен.)")
    lazy var rainPercentageLabel = ConditionLabel(text: "55%")
    lazy var cloudPercentageLabel = ConditionLabel(text: "72%")
    
    lazy var feelsLikeSeparator = createSeparator()
    lazy var windSeparator = createSeparator()
    lazy var uvIndexSeparator = createSeparator()
    lazy var rainSeparator = createSeparator()
    lazy var cloudinessSeparator = createSeparator()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.rubik(.regular, size: 30)
        let textColor = UIColor.customBlack
        
        let attributedString = NSMutableAttributedString(string: "13°", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.6
        ])
        
        label.attributedText = attributedString
        return label
    }()
    
    lazy var conditionLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.rubik(.medium, size: 18)
        let textColor = UIColor.customBlack
        
        let attributedString = NSMutableAttributedString(string: "Ливни", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.36
        ])
        
        label.attributedText = attributedString
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.rubik(.regular, size: 18)
        let textColor = UIColor.customBlack
        
        let attributedString = NSMutableAttributedString(string: "День", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: -0.18
        ])
        
        label.attributedText = attributedString
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
        
    private func setupViews() {
        contentView.backgroundColor = .customLightBlue
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        contentView.addSubview(titleLabel)
        contentView.addSubview(tempLabel)
        contentView.addSubview(currentImageView)
        contentView.addSubview(conditionLabel)
        
        contentView.addSubview(feelsLikeImageView)
        contentView.addSubview(windImageView)
        contentView.addSubview(uvIndexImageView)
        contentView.addSubview(rainImageView)
        contentView.addSubview(cloudinessImageView)
        
        contentView.addSubview(feelsLikeLabel)
        contentView.addSubview(windLabel)
        contentView.addSubview(uvIndexLabel)
        contentView.addSubview(rainChanceLabel)
        contentView.addSubview(cloudinessLabel)
        
        contentView.addSubview(feelsLikePercentageLabel)
        contentView.addSubview(speedLabel)
        contentView.addSubview(uvNumberLabel)
        contentView.addSubview(rainPercentageLabel)
        contentView.addSubview(cloudPercentageLabel)
        
        contentView.addSubview(feelsLikeSeparator)
        contentView.addSubview(windSeparator)
        contentView.addSubview(uvIndexSeparator)
        contentView.addSubview(rainSeparator)
        contentView.addSubview(cloudinessSeparator)
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        currentImageView.translatesAutoresizingMaskIntoConstraints = false
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        feelsLikeImageView.translatesAutoresizingMaskIntoConstraints = false
        windImageView.translatesAutoresizingMaskIntoConstraints = false
        uvIndexImageView.translatesAutoresizingMaskIntoConstraints = false
        rainImageView.translatesAutoresizingMaskIntoConstraints = false
        cloudinessImageView.translatesAutoresizingMaskIntoConstraints = false
        
        feelsLikeLabel.translatesAutoresizingMaskIntoConstraints = false
        windLabel.translatesAutoresizingMaskIntoConstraints = false
        uvIndexLabel.translatesAutoresizingMaskIntoConstraints = false
        rainChanceLabel.translatesAutoresizingMaskIntoConstraints = false
        cloudinessLabel.translatesAutoresizingMaskIntoConstraints = false
        
        feelsLikePercentageLabel.translatesAutoresizingMaskIntoConstraints = false
        speedLabel.translatesAutoresizingMaskIntoConstraints = false
        uvNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        rainPercentageLabel.translatesAutoresizingMaskIntoConstraints = false
        cloudPercentageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        setupSeparatorConstraints(separator: feelsLikeSeparator, belowView: feelsLikeLabel)
        setupSeparatorConstraints(separator: windSeparator, belowView: windLabel)
        setupSeparatorConstraints(separator: uvIndexSeparator, belowView: uvIndexLabel)
        setupSeparatorConstraints(separator: rainSeparator, belowView: rainChanceLabel)
        setupSeparatorConstraints(separator: cloudinessSeparator, belowView: cloudinessLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -298),
            
            tempLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 32),
            tempLabel.heightAnchor.constraint(equalToConstant: 36),
            tempLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 170),
            tempLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            
            currentImageView.widthAnchor.constraint(greaterThanOrEqualToConstant: 32),
            currentImageView.heightAnchor.constraint(equalToConstant: 36),
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
         separator.translatesAutoresizingMaskIntoConstraints = false
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
    }
 }

