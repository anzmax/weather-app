import UIKit

class SearchLocationVC: UIViewController {
    
    private let searchLocationView = SearchLocationView()
    private let coordinator: AppCoordinator
    private let locationSearchService = GeocodeService.shared
    
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
    }
    
    func updateCityLabel(with cityName: String) {
        searchLocationView.cityLabel.text = cityName
        searchLocationView.addLocationButton.isHidden = false
    }
}

extension SearchLocationVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        locationSearchService.searchLocation(for: searchText) { [weak self] formattedAddress in
                DispatchQueue.main.async {
                    self?.updateCityLabel(with: formattedAddress)
                }
            }
        }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        self.updateCityLabel(with: "")    }
}
