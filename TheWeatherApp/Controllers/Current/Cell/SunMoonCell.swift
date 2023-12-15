import UIKit

class SunMoonCell: UITableViewCell {
    
    static let id = "SunMoonCell"
    
    lazy var fullMoonView = CustomView(backgroundColor: .customBlue, cornerRadius: 7.5)
    lazy var dividerView = CustomView(backgroundColor: .customDarkBlue, cornerRadius: 0)
    
    lazy var sunImageView = CustomImageView(named: "sun")
    lazy var moonImageView = CustomImageView(named: "moon")
    
    lazy var sunriseLabel = RegularLabel(text: "Восход", color: .customGray, size: 14)
    lazy var sunsetLabel = RegularLabel(text: "Заход", color: .customGray, size: 14)
    lazy var sunTimeLabel = RegularLabel(text: "14ч 27 мин", color: .customBlack, size: 16)
    lazy var sunriseTimeLabel = RegularLabel(text: "05:19", color: .customBlack, size: 16)
    lazy var sunsetTimeLabel = RegularLabel(text: "19:46", color: .customBlack, size: 16)
    lazy var sunMoonLabel = RegularLabel(text: "Солнце и Луна", color: .customGray, size: 18)
    
    lazy var fullMoonLabel = RegularLabel(text: "Полнолуние", color: .customBlack, size: 14)
    lazy var moonriseLabel = RegularLabel(text: "Восход", color: .customGray, size: 14)
    lazy var moonsetLabel = RegularLabel(text: "Заход", color: .customGray, size: 14)
    lazy var moonriseTimeLabel = RegularLabel(text: "05:19", color: .customBlack, size: 16)
    lazy var moonsetTimeLabel = RegularLabel(text: "19:46", color: .customBlack, size: 16)
    lazy var moonTimeLabel = RegularLabel(text: "14ч 27 мин", color: .customBlack, size: 16)
    
    lazy var sunriseDashedLine = DashedLineView()
    lazy var sunsetDashedLine = DashedLineView()
    lazy var moonriseDashedLine = DashedLineView()
    lazy var moonsetDashedLine = DashedLineView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Update
    func update(with forecast: Forecast) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        sunriseTimeLabel.text = forecast.sunrise
        sunsetTimeLabel.text = forecast.sunset
        moonriseTimeLabel.text = forecast.riseBegin
        moonsetTimeLabel.text = forecast.setEnd
 
        if let sunriseDate = dateFormatter.date(from: forecast.sunrise), let sunsetDate = dateFormatter.date(from: forecast.sunset) {
            let timeInterval = sunsetDate.timeIntervalSince(sunriseDate)
            
            let hours = Int(timeInterval) / 3600
            let minutes = Int(timeInterval) % 3600 / 60
            sunTimeLabel.text = "\(hours)ч \(minutes) мин"
        }
        
        if let moonriseDate = dateFormatter.date(from: forecast.riseBegin), let moonsetDate = dateFormatter.date(from: forecast.setEnd) {
            let moonTimeInterval = moonsetDate.timeIntervalSince(moonriseDate)
            
            let moonHours = Int(moonTimeInterval) / 3600
            let moonMinutes = Int(moonTimeInterval) % 3600 / 60
            moonTimeLabel.text = "\(moonHours)ч \(moonMinutes) мин"
        }
    }
}

//MARK: - Layout
extension SunMoonCell {
    private func setupViews() {
        [sunMoonLabel, fullMoonLabel, fullMoonView, sunTimeLabel, sunImageView, sunriseLabel, sunsetLabel, dividerView, sunriseTimeLabel, sunsetTimeLabel, moonImageView, moonTimeLabel, moonriseLabel, moonsetLabel, moonriseTimeLabel, moonsetTimeLabel, sunriseDashedLine, sunsetDashedLine, moonriseDashedLine, moonsetDashedLine ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            sunMoonLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            sunMoonLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sunMoonLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -110),
            
            sunTimeLabel.topAnchor.constraint(equalTo: sunMoonLabel.bottomAnchor, constant: 18),
            sunTimeLabel.leadingAnchor.constraint(equalTo: sunImageView.trailingAnchor, constant: 40),
            
            sunImageView.topAnchor.constraint(equalTo: sunMoonLabel.bottomAnchor, constant: 17),
            sunImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            sunImageView.widthAnchor.constraint(equalToConstant: 23),
            sunImageView.heightAnchor.constraint(equalToConstant: 23),
            
            dividerView.widthAnchor.constraint(equalToConstant: 0.7),
            dividerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            dividerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dividerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            sunriseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            sunriseLabel.topAnchor.constraint(equalTo: sunImageView.bottomAnchor, constant: 18),
            
            sunsetLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            sunsetLabel.topAnchor.constraint(equalTo: sunriseLabel.bottomAnchor, constant: 17),
            
            sunriseTimeLabel.leadingAnchor.constraint(equalTo: sunriseLabel.trailingAnchor, constant: 46),
            sunriseTimeLabel.topAnchor.constraint(equalTo: sunTimeLabel.bottomAnchor, constant: 20),
            
            sunsetTimeLabel.leadingAnchor.constraint(equalTo: sunsetLabel.trailingAnchor, constant: 55),
            sunsetTimeLabel.topAnchor.constraint(equalTo: sunriseTimeLabel.bottomAnchor, constant: 16),
            
            fullMoonLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            fullMoonLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            fullMoonView.topAnchor.constraint(equalTo: contentView.topAnchor),
            fullMoonView.trailingAnchor.constraint(equalTo: fullMoonLabel.leadingAnchor, constant: -5),
            fullMoonView.heightAnchor.constraint(equalToConstant: 15),
            fullMoonView.widthAnchor.constraint(equalToConstant: 15),
            
            moonTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            moonTimeLabel.topAnchor.constraint(equalTo: fullMoonLabel.bottomAnchor, constant: 20),
            
            moonImageView.topAnchor.constraint(equalTo: fullMoonLabel.bottomAnchor, constant: 20),
            moonImageView.trailingAnchor.constraint(equalTo: moonTimeLabel.leadingAnchor, constant: -36),
            moonImageView.heightAnchor.constraint(equalToConstant: 20),
            moonImageView.widthAnchor.constraint(equalToConstant: 20),
            
            moonriseLabel.topAnchor.constraint(equalTo: moonImageView.bottomAnchor, constant: 20),
            moonriseLabel.trailingAnchor.constraint(equalTo: moonriseTimeLabel.leadingAnchor, constant: -49),
            
            moonsetLabel.topAnchor.constraint(equalTo: moonriseLabel.bottomAnchor, constant: 17),
            moonsetLabel.trailingAnchor.constraint(equalTo: moonsetTimeLabel.leadingAnchor, constant: -58),
            
            moonriseTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            moonriseTimeLabel.topAnchor.constraint(equalTo: moonTimeLabel.bottomAnchor, constant: 20),
            
            moonsetTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            moonsetTimeLabel.topAnchor.constraint(equalTo: moonriseTimeLabel.bottomAnchor, constant: 16),
            
            sunriseDashedLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sunriseDashedLine.trailingAnchor.constraint(equalTo: sunriseTimeLabel.trailingAnchor),
            sunriseDashedLine.topAnchor.constraint(equalTo: sunTimeLabel.bottomAnchor, constant: 12),
            sunriseDashedLine.heightAnchor.constraint(equalToConstant: 1),
            
            sunsetDashedLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sunsetDashedLine.trailingAnchor.constraint(equalTo: sunsetTimeLabel.trailingAnchor),
            sunsetDashedLine.topAnchor.constraint(equalTo: sunriseDashedLine.bottomAnchor, constant: 36),
            sunsetDashedLine.heightAnchor.constraint(equalToConstant: 1),
            
            moonriseDashedLine.leadingAnchor.constraint(equalTo: dividerView.trailingAnchor, constant: 16),
            moonriseDashedLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            moonriseDashedLine.topAnchor.constraint(equalTo: moonTimeLabel.bottomAnchor, constant: 12),
            moonriseDashedLine.heightAnchor.constraint(equalToConstant: 1),
            
            moonsetDashedLine.leadingAnchor.constraint(equalTo: dividerView.trailingAnchor, constant: 16),
            moonsetDashedLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            moonsetDashedLine.topAnchor.constraint(equalTo: moonriseLabel.bottomAnchor, constant: 9),
            moonsetDashedLine.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}
