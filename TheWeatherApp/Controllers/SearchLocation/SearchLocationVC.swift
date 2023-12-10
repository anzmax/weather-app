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
    
//    @objc func addButtonTapped() {
//        
//        guard let placemark = currentPlacemark else { return }
//        
//        let name = placemark.name ?? ""
//        let id = UUID().uuidString
//        let lat = Double(placemark.location?.coordinate.latitude ?? 0.0)
//        let lon = Double(placemark.location?.coordinate.longitude ?? 0.0)
//        let country = placemark.country ?? ""
//    
//        
//        let location: Location = Location.init(name: name, country: country, id: id, latitude: lat, longtitude: lon)
//        
//        var locations = locationArchiver.fetch()
//        locations.append(location)
//        locationArchiver.save(locations)
//        
//        print(locationArchiver.fetch())
//        self.navigationController?.popViewController(animated: true)
//    }
    
    @objc func addButtonTapped() {
        
        guard let placemark = currentPlacemark else { return }
        
        let name = placemark.name ?? ""
        let id = UUID().uuidString
        let lat = Double(placemark.location?.coordinate.latitude ?? 0.0)
        let lon = Double(placemark.location?.coordinate.longitude ?? 0.0)
        let country = placemark.country ?? ""

        let newLocation = Location(name: name, country: country, id: id, latitude: lat, longtitude: lon)
        
        var locations = locationArchiver.fetch()

        if !locations.contains(where: {
            $0.latitude == newLocation.latitude &&
            $0.longtitude == newLocation.longtitude &&
            $0.name == newLocation.name }) {
            
            locations.append(newLocation)
            locationArchiver.save(locations)
        } else {
            print("Location already exists")
        }
        self.navigationController?.popViewController(animated: true)
    }

}

extension SearchLocationVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.currentPlacemark = nil
            self.searchLocationView.update()
        } else {
            locationSearchService.searchLocation(by: searchText) { [weak self] placemark in
                DispatchQueue.main.async {
                    self?.currentPlacemark = placemark
                    self?.searchLocationView.update(placemark)
                }
            }
        }
    }
}
