import UIKit

class DailyCell: UITableViewCell {
    
    static let id = "DailyCell"
    
    var action: (() -> Void)?
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .customLightBlue
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    lazy var weatherImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "precIcon")
        return view
    }()
    
    lazy var percentageLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.rubik(.regular, size: 12)
        let textColor = UIColor.customBlue
        let attributedString = NSMutableAttributedString(string: "57%", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: -0.12
        ])
        label.attributedText = attributedString
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.rubik(.regular, size: 16)
        let textColor = UIColor.black
        let attributedString = NSMutableAttributedString(string: "Местами дождь", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.16
        ])
        label.attributedText = attributedString
        return label
    }()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.rubik(.regular, size: 18)
        let textColor = UIColor.customBlack
        
        let attributedString = NSMutableAttributedString(string: "4°-11°", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: -0.18
        ])
        label.attributedText = attributedString
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

    func update(with forecast: Forecast) {
        
        if let weatherCondition = WeatherCondition(rawValue: forecast.parts.dayShort.condition) {
            descriptionLabel.text = weatherCondition.russianDescription
        } else {
            descriptionLabel.text = "Неизвестно"
        }
        percentageLabel.text = "\(forecast.parts.dayShort.precipitation)%"
        let tempMin = forecast.parts.dayShort.tempMin ?? 0
        let tempMax = forecast.parts.dayShort.tempMax ?? 0
        tempLabel.text = "\(tempMin)° - \(tempMax)°"
    }

    private func setupViews() {
        contentView.addSubview(mainView)
        mainView.addSubview(dateLabel)
        mainView.addSubview(weatherImageView)
        mainView.addSubview(percentageLabel)
        mainView.addSubview(descriptionLabel)
        mainView.addSubview(tempLabel)
        mainView.addSubview(currentDetailButton)
    }
    
    private func setupConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        percentageLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        currentDetailButton.translatesAutoresizingMaskIntoConstraints = false
        
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
            descriptionLabel.widthAnchor.constraint(equalToConstant: 206),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 19),
            
            tempLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 17),
            tempLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -17.17),
            tempLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -28),
            tempLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 60),
            tempLabel.heightAnchor.constraint(equalToConstant: 21.8),
            
            currentDetailButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            currentDetailButton.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        ])
    }
    
    @objc func currentDetailButtonPressed() {
        action?()
    }
}
