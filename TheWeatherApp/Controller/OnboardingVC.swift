import UIKit

class OnboardingVC: UIViewController {
    
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
    
    private lazy var useGeoButton: UIButton = {
        let button = UIButton()
        button.setTitle("ИСПОЛЬЗОВАТЬ МЕСТОПОЛОЖЕНИЕ  УСТРОЙСТВА", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 12)
        button.backgroundColor = .customOrange
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var dismissGeoButton: UIButton = {
        let button = UIButton()
        button.setTitle("НЕТ, Я БУДУ ДОБАВЛЯТЬ ЛОКАЦИИ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 16)
        button.backgroundColor = .customBlue
        button.titleLabel?.textAlignment = .right
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .customBlue
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(secondaryLabel)
        view.addSubview(thirdLabel)
        view.addSubview(useGeoButton)
        view.addSubview(dismissGeoButton)
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        useGeoButton.translatesAutoresizingMaskIntoConstraints = false
        dismissGeoButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 148),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 196),
            imageView.widthAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            titleLabel.widthAnchor.constraint(equalToConstant: 322),
            titleLabel.heightAnchor.constraint(equalToConstant: 63),
            
            secondaryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 519),
            secondaryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            secondaryLabel.widthAnchor.constraint(equalToConstant: 314),
            secondaryLabel.heightAnchor.constraint(equalToConstant: 36),
            
            thirdLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 569),
            thirdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            thirdLabel.widthAnchor.constraint(equalToConstant: 314),
            thirdLabel.heightAnchor.constraint(equalToConstant: 36),
            
            useGeoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 649),
            useGeoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            useGeoButton.widthAnchor.constraint(equalToConstant: 340),
            useGeoButton.heightAnchor.constraint(equalToConstant: 40),
            
            dismissGeoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 714),
            dismissGeoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            dismissGeoButton.widthAnchor.constraint(equalToConstant: 291),
            dismissGeoButton.heightAnchor.constraint(equalToConstant: 21),
        ])
    }
    
}
