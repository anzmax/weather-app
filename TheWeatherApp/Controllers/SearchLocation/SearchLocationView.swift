import UIKit

class SearchLocationView: UIView {
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Введите название города"
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 3
        label.font = UIFont(name: "Rubik-Medium", size: 18)
        return label
    }()
    
    lazy var addLocationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 22)
        button.backgroundColor = .customOrange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.isHidden = true  
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
        backgroundColor = .white
        addSubview(searchBar)
        addSubview(cityLabel)
        addSubview(addLocationButton)
    }
    
    private func setupConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        addLocationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            cityLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 50),
            cityLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            cityLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            cityLabel.heightAnchor.constraint(equalToConstant: 150),
            
            addLocationButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addLocationButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            addLocationButton.widthAnchor.constraint(equalToConstant: 300),
            addLocationButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
