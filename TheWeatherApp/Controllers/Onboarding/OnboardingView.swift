import UIKit

class OnboardingView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "onboardingImage"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Разрешить приложению Weather использовать данные о местоположении вашего устройства"
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = UIFont(name: "Rubik-SemiBold", size: 16)
        return label
    }()
    
    lazy var secondaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Чтобы получить более точные прогнозы погоды во время движения или путешествия"
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = UIFont(name: "Rubik-Regular", size: 14)
        return label
    }()
    
    lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы можете изменить свой выбор в любое время из меню приложения"
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = UIFont(name: "Rubik-Regular", size: 14)
        return label
    }()
    
    lazy var useGeoButton: UIButton = {
        let button = UIButton()
        button.setTitle("ИСПОЛЬЗОВАТЬ МЕСТОПОЛОЖЕНИЕ  УСТРОЙСТВА", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 12)
        button.backgroundColor = .customOrange
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var dismissGeoButton: UIButton = {
        let button = UIButton()
        button.setTitle("НЕТ, Я БУДУ ДОБАВЛЯТЬ ЛОКАЦИИ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 16)
        button.backgroundColor = .customBlue
        button.titleLabel?.textAlignment = .right
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
        backgroundColor = .customBlue
        [imageView, titleLabel, secondaryLabel, thirdLabel, useGeoButton, dismissGeoButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 148),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 196),
            imageView.widthAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 400),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27),
            titleLabel.widthAnchor.constraint(equalToConstant: 322),
            titleLabel.heightAnchor.constraint(equalToConstant: 63),
            
            secondaryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 519),
            secondaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 31),
            secondaryLabel.widthAnchor.constraint(equalToConstant: 314),
            secondaryLabel.heightAnchor.constraint(equalToConstant: 36),
            
            thirdLabel.topAnchor.constraint(equalTo: topAnchor, constant: 569),
            thirdLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 31),
            thirdLabel.widthAnchor.constraint(equalToConstant: 314),
            thirdLabel.heightAnchor.constraint(equalToConstant: 36),
            
            useGeoButton.topAnchor.constraint(equalTo: topAnchor, constant: 649),
            useGeoButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            useGeoButton.widthAnchor.constraint(equalToConstant: 340),
            useGeoButton.heightAnchor.constraint(equalToConstant: 40),
            
            dismissGeoButton.topAnchor.constraint(equalTo: topAnchor, constant: 714),
            dismissGeoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 66),
            dismissGeoButton.widthAnchor.constraint(equalToConstant: 291),
            dismissGeoButton.heightAnchor.constraint(equalToConstant: 21),
        ])
    }
}
