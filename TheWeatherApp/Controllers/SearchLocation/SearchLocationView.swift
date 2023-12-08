import UIKit
import CoreLocation

class SearchLocationView: UIView {
    
    lazy var cityLabel = MediumLabel(text: "", color: .customBlack, size: 18)
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Введите название города"
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    lazy var addLocationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.titleLabel?.font = UIFont.rubik(.medium, size: 22)
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
        [searchBar, cityLabel, addLocationButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            cityLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 50),
            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityLabel.heightAnchor.constraint(equalToConstant: 150),
            
            addLocationButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addLocationButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            addLocationButton.widthAnchor.constraint(equalToConstant: 300),
            addLocationButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension SearchLocationView {
    
    func update(_ placemark: CLPlacemark? = nil) {
        
        guard let placemark else {
            cityLabel.text = ""
            return
        }
//        if placemark == nil {
//            cityLabel.text = ""
//            return
//        }
        
        let placeName = placemark.locality ?? ""
        let country = placemark.country ?? ""
        let administrativeArea = placemark.administrativeArea ?? ""
        let formattedString = "\(placeName), \(administrativeArea), \(country)"
        
        cityLabel.text = formattedString
        addLocationButton.isHidden = false
        
    }
}
