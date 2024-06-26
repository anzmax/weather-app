import UIKit
import CoreLocation

class SearchLocationVC: UIViewController {
    
    private let searchLocationView = SearchLocationView()
    private let coordinator: AppCoordinator
    
    //MARK: Services
    private let locationSearchService = GeocodeService.shared
    private let locationArchiver = LocationsArchiver()
    private let weatherService = WeatherService()
    private let coreDataService = CoreDataService()
    
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
        navigationItem.title = "Добавить город".localized
        searchLocationView.searchBar.delegate = self
        searchLocationView.addLocationButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - Action
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
            
            weatherService.fetchWeather(latitude: lat, longitude: lon) { result in
                
                switch result {
                case .success(let weather):
                    
                    self.coreDataService.saveWeather(weather: weather)
                    
                    _ = self.coreDataService.fetchWeather()
                    self.coordinator.showMainViewController()
                    
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            print("Location already exists")
        }
    }
}

//MARK: - Delegate
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
