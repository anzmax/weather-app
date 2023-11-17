import UIKit

class SettingsView: UIView {
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "settingsBG")
        return imageView
    }()
    
    lazy var centerView: UIView = {
        let view = UIView()
        view.backgroundColor = .customWhite
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Настройки"
        label.font = UIFont(name: "Rubik-Medium", size: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var tempLabel = CustomLabel(text: "Температура")
    lazy var speedLabel = CustomLabel(text: "Скорость ветра")
    lazy var dateFormatLabel = CustomLabel(text: "Формат времени")
    lazy var notificationLabel = CustomLabel(text: "Уведомления")
    
    lazy var tempSegmentControl = CustomSegmentedControl(items: ["C", "F"])
    lazy var speedSegmentControl = CustomSegmentedControl(items: ["Mi", "Km"])
    lazy var dateFormatSegmentControl = CustomSegmentedControl(items: ["12", "24"])
    lazy var notificationSegmentControl = CustomSegmentedControl(items: ["On", "Off"])
    
    lazy var acceptSettingsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .customOrange
        button.setTitle("Установить", for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 16)
        button.setTitleColor(.customWhite, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 10
        return button
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
        addSubview(backgroundImageView)
        addSubview(centerView)
        centerView.addSubview(settingsLabel)
        centerView.addSubview(tempLabel)
        centerView.addSubview(speedLabel)
        centerView.addSubview(dateFormatLabel)
        centerView.addSubview(notificationLabel)
        centerView.addSubview(tempSegmentControl)
        centerView.addSubview(speedSegmentControl)
        centerView.addSubview(dateFormatSegmentControl)
        centerView.addSubview(notificationSegmentControl)
        centerView.addSubview(acceptSettingsButton)
    }
    
    private func setupConstraints() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        centerView.translatesAutoresizingMaskIntoConstraints = false
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        acceptSettingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        speedLabel.translatesAutoresizingMaskIntoConstraints = false
        dateFormatLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        tempSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        speedSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        dateFormatSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        notificationSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            centerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            centerView.topAnchor.constraint(equalTo: topAnchor, constant: 241),
            centerView.widthAnchor.constraint(equalToConstant: 320),
            centerView.heightAnchor.constraint(equalToConstant: 330),
            
            settingsLabel.widthAnchor.constraint(equalToConstant: 112),
            settingsLabel.heightAnchor.constraint(equalToConstant: 15),
            settingsLabel.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 20),
            settingsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 268),
            
            tempLabel.widthAnchor.constraint(equalToConstant: 112),
            tempLabel.heightAnchor.constraint(equalToConstant: 20),
            tempLabel.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 20),
            tempLabel.topAnchor.constraint(equalTo: topAnchor, constant: 303),
            
            speedLabel.widthAnchor.constraint(equalToConstant: 129),
            speedLabel.heightAnchor.constraint(equalToConstant: 20),
            speedLabel.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 20),
            speedLabel.topAnchor.constraint(equalTo: topAnchor, constant: 353),
            
            dateFormatLabel.widthAnchor.constraint(equalToConstant: 138),
            dateFormatLabel.heightAnchor.constraint(equalToConstant: 20),
            dateFormatLabel.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 20),
            dateFormatLabel.topAnchor.constraint(equalTo: topAnchor, constant: 403),
            
            notificationLabel.widthAnchor.constraint(equalToConstant: 112),
            notificationLabel.heightAnchor.constraint(equalToConstant: 20),
            notificationLabel.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 20),
            notificationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 453),
            
            tempSegmentControl.widthAnchor.constraint(equalToConstant: 80),
            tempSegmentControl.heightAnchor.constraint(equalToConstant: 30),
            tempSegmentControl.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 210),
            tempSegmentControl.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -30),
            tempSegmentControl.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 57),
            tempSegmentControl.bottomAnchor.constraint(equalTo: centerView.bottomAnchor, constant: -243),
            
            speedSegmentControl.widthAnchor.constraint(equalToConstant: 80),
            speedSegmentControl.heightAnchor.constraint(equalToConstant: 30),
            speedSegmentControl.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 210),
            speedSegmentControl.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -30),
            speedSegmentControl.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 107),
            speedSegmentControl.bottomAnchor.constraint(equalTo: centerView.bottomAnchor, constant: -193),
            
            dateFormatSegmentControl.widthAnchor.constraint(equalToConstant: 80),
            dateFormatSegmentControl.heightAnchor.constraint(equalToConstant: 30),
            dateFormatSegmentControl.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 210),
            dateFormatSegmentControl.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -30),
            dateFormatSegmentControl.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 157),
            dateFormatSegmentControl.bottomAnchor.constraint(equalTo: centerView.bottomAnchor, constant: -143),
            
            notificationSegmentControl.widthAnchor.constraint(equalToConstant: 80),
            notificationSegmentControl.heightAnchor.constraint(equalToConstant: 30),
            notificationSegmentControl.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 210),
            notificationSegmentControl.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -30),
            notificationSegmentControl.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 207),
            notificationSegmentControl.bottomAnchor.constraint(equalTo: centerView.bottomAnchor, constant: -93),
            
            acceptSettingsButton.widthAnchor.constraint(equalToConstant: 250),
            acceptSettingsButton.heightAnchor.constraint(equalToConstant: 40),
            acceptSettingsButton.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 35),
            acceptSettingsButton.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -35),
            acceptSettingsButton.topAnchor.constraint(equalTo: topAnchor, constant: 515),
            acceptSettingsButton.bottomAnchor.constraint(equalTo: centerView.bottomAnchor, constant: -16),
        ])
    }
}
