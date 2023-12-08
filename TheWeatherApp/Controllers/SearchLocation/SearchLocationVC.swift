import UIKit
import CoreLocation

class SearchLocationVC: UIViewController {
    
    private let searchLocationView = SearchLocationView()
    private let coordinator: AppCoordinator
    private let locationSearchService = GeocodeService.shared
    private let locationArchiver = LocationsArchiver()
    
    var currentPlacemark: CLPlacemark?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = searchLocationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Добавить город"
        searchLocationView.searchBar.delegate = self
        searchLocationView.addLocationButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
//    func updateCityLabel(with cityName: String) {
//        searchLocationView.cityLabel.text = cityName
//        searchLocationView.addLocationButton.isHidden = false
//    }
    
    @objc func addButtonTapped() {
        
        guard let placemark = currentPlacemark else { return }
        
        let name = placemark.name ?? ""
        let id = UUID().uuidString
        let lat = Double(placemark.location?.coordinate.latitude ?? 0.0)
        let lon = Double(placemark.location?.coordinate.longitude ?? 0.0)
        let country = placemark.country ?? ""
    
        
        let location: Location = Location.init(name: name, country: country, id: id, latitude: lat, longtitude: lon)
        
        var locations = locationArchiver.fetch()
        locations.append(location)
        locationArchiver.save(locations)
        
        print(locationArchiver.fetch())
    }
}

extension SearchLocationVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //        locationSearchService.searchLocation(for: searchText) { [weak self] formattedAddress in
        //                DispatchQueue.main.async {
        //                    self?.updateCityLabel(with: formattedAddress)
        //                }
        //            }
        
        locationSearchService.searchLocation(by: searchText) { [weak self] placemark in
            DispatchQueue.main.async {
                self?.currentPlacemark = placemark
                self?.searchLocationView.update(placemark)
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        print("No")
        //self.updateCityLabel(with: "")
        self.searchLocationView.update()
    }
}
