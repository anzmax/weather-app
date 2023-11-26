import UIKit

class CurrentCell: UITableViewCell {
    
    static let id = "CurrentCell"
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .customBlue
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var sunriseTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: RubikFonts.medium.rawValue, size: 14)
        label.textColor = .white
        label.text = "05:41"
        return label
    }()
    
    lazy var sunsetTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: RubikFonts.medium.rawValue, size: 14)
        label.textColor = .white
        label.text = "19:31"
        return label
    }()
    
    lazy var sunriseImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "sunrise")
        return view
    }()
    
    lazy var sunsetImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "sunset")
        return view
    }()
    
    lazy var ellipseImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ellipse")
        return view
    }()
    
    lazy var degreeRangeLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: RubikFonts.regular.rawValue, size: 16) ?? UIFont.systemFont(ofSize: 36)
        let textColor = UIColor.white

        let attributedString = NSMutableAttributedString(string: "7°/13°", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.32
        ])
        
        label.attributedText = attributedString
        return label
    }()
    
    lazy var forecastLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: "Rubik-Regular", size: 16) ?? UIFont.systemFont(ofSize: 36)
        let textColor = UIColor.white

        let attributedString = NSMutableAttributedString(string: "Возможен небольшой дождь", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.16,
        ])
        
        label.attributedText = attributedString
        return label
    }()
    
    lazy var degreeLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: "Rubik-Medium", size: 36) ?? UIFont.systemFont(ofSize: 36)
        let textColor = UIColor.white

        let attributedString = NSMutableAttributedString(string: "13°", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 3.06
        ])
        
        label.attributedText = attributedString
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
        return button
    }()
    
    lazy var cloudImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "cloudSun")
        return view
    }()
    
    lazy var windImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "windWhite")
        return view
    }()
    
    lazy var humidityImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "humidityWhite")
        return view
    }()
    
    lazy var cloudLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: RubikFonts.regular.rawValue, size: 14) ?? UIFont.systemFont(ofSize: 14)
        let textColor = UIColor.white

        let attributedString = NSMutableAttributedString(string: "0", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.14
        ])
        
        label.attributedText = attributedString
        return label
    }()
    
    lazy var windLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: RubikFonts.regular.rawValue, size: 14) ?? UIFont.systemFont(ofSize: 14)
        let textColor = UIColor.white

        let attributedString = NSMutableAttributedString(string: "3 м/с", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.14
        ])
        
        label.attributedText = attributedString
        return label
    }()
    
    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: RubikFonts.regular.rawValue, size: 14) ?? UIFont.systemFont(ofSize: 14)
        let textColor = UIColor.white

        let attributedString = NSMutableAttributedString(string: "75%", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.14
        ])
        
        label.attributedText = attributedString
        return label
    }()
    
    lazy var currentDayTimeLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: RubikFonts.regular.rawValue, size: 16) ?? UIFont.systemFont(ofSize: 16)
        let textColor = UIColor.customYellow

        let attributedString = NSMutableAttributedString(string: "17:48, пт 16 апреля", attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: 0.14
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
        contentView.addSubview(mainView)
        contentView.addSubview(detailButton)
        mainView.addSubview(sunriseTimeLabel)
        mainView.addSubview(sunsetTimeLabel)
        mainView.addSubview(sunriseImageView)
        mainView.addSubview(sunsetImageView)
        mainView.addSubview(ellipseImageView)
        mainView.addSubview(degreeRangeLabel)
        mainView.addSubview(degreeLabel)
        mainView.addSubview(forecastLabel)
        mainView.addSubview(cloudImageView)
        mainView.addSubview(windImageView)
        mainView.addSubview(humidityImageView)
        mainView.addSubview(cloudLabel)
        mainView.addSubview(windLabel)
        mainView.addSubview(humidityLabel)
        mainView.addSubview(currentDayTimeLabel)
    }
    
    private func setupConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        sunriseTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        sunsetTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        sunriseImageView.translatesAutoresizingMaskIntoConstraints = false
        sunsetImageView.translatesAutoresizingMaskIntoConstraints = false
        ellipseImageView.translatesAutoresizingMaskIntoConstraints = false
        degreeRangeLabel.translatesAutoresizingMaskIntoConstraints = false
        degreeLabel.translatesAutoresizingMaskIntoConstraints = false
        forecastLabel.translatesAutoresizingMaskIntoConstraints = false
        cloudImageView.translatesAutoresizingMaskIntoConstraints = false
        windImageView.translatesAutoresizingMaskIntoConstraints = false
        humidityImageView.translatesAutoresizingMaskIntoConstraints = false
        cloudLabel.translatesAutoresizingMaskIntoConstraints = false
        windLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        currentDayTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
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
            sunriseTimeLabel.widthAnchor.constraint(equalToConstant: 38),
            sunriseTimeLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 17),
            sunriseTimeLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 167),
            
            sunsetTimeLabel.heightAnchor.constraint(equalToConstant: 19),
            sunsetTimeLabel.widthAnchor.constraint(equalToConstant: 38),
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
            degreeRangeLabel.widthAnchor.constraint(equalToConstant: 50),
            degreeRangeLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            degreeRangeLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 33),
            
            degreeLabel.heightAnchor.constraint(equalToConstant: 40),
            degreeLabel.widthAnchor.constraint(equalToConstant: 80),
            degreeLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 153),
            degreeLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 58),
            
            forecastLabel.heightAnchor.constraint(equalToConstant: 20),
            forecastLabel.widthAnchor.constraint(equalToConstant: 270),
            forecastLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 103),
            forecastLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 66),
            
            cloudImageView.heightAnchor.constraint(equalToConstant: 18),
            cloudImageView.widthAnchor.constraint(equalToConstant: 23),
            cloudImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 138),
            cloudImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 83),
            
            windImageView.heightAnchor.constraint(equalToConstant: 18),
            windImageView.widthAnchor.constraint(equalToConstant: 25),
            windImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 140),
            windImageView.leadingAnchor.constraint(equalTo: cloudLabel.trailingAnchor, constant: 20),
            
            humidityImageView.heightAnchor.constraint(equalToConstant: 15),
            humidityImageView.widthAnchor.constraint(equalToConstant: 13),
            humidityImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 139),
            humidityImageView.leadingAnchor.constraint(equalTo: windLabel.trailingAnchor, constant: 20),
            
            cloudLabel.heightAnchor.constraint(equalToConstant: 18),
            cloudLabel.widthAnchor.constraint(equalToConstant: 9),
            cloudLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 138),
            cloudLabel.leadingAnchor.constraint(equalTo: cloudImageView.trailingAnchor, constant: 5),
            
            windLabel.heightAnchor.constraint(equalToConstant: 18),
            windLabel.widthAnchor.constraint(equalToConstant: 40),
            windLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 138),
            windLabel.leadingAnchor.constraint(equalTo: windImageView.trailingAnchor, constant: 5),
            
            humidityLabel.heightAnchor.constraint(equalToConstant: 18),
            humidityLabel.widthAnchor.constraint(equalToConstant: 27),
            humidityLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 138),
            humidityLabel.leadingAnchor.constraint(equalTo: humidityImageView.trailingAnchor, constant: 5),
            
            currentDayTimeLabel.heightAnchor.constraint(equalToConstant: 20),
            currentDayTimeLabel.widthAnchor.constraint(equalToConstant: 151),
            currentDayTimeLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 171),
            currentDayTimeLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 105)
        ])
    }
}