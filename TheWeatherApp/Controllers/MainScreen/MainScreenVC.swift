import UIKit
import CoreLocation

class MainScreenVC: UIViewController {
    
    private let mainScreenView = MainScreenView()
    private let coordinator: AppCoordinator
    var currentLocation: CLLocation?

    override func loadView() {
        view = mainScreenView
    }

    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(settingsButtonTapped(_:)))
        navigationItem.leftBarButtonItem?.tintColor = .customBlack
        loadWeatherData()
        mainScreenView.onButtonTapped = { [weak self] indexPath in
            self?.coordinator.showTwentyFourHourVC()
        }
    }
    
    @objc func settingsButtonTapped(_ sender: UIBarButtonItem) {
        coordinator.showSettingsViewController()
    }
    
    
    func loadWeatherData() {
        guard let location = currentLocation else { return }
        
        WeatherService.shared.fetchWeather(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weatherData):
                    self?.updateCurrentWeatherCell(with: weatherData)
                case .failure(let error):
                    print("Ошибка: \(error.localizedDescription)")
                }
            }
        }
    }

    func updateCurrentWeatherCell(with weatherData: WeatherData) {
        if let cell = mainScreenView.tableView.cellForRow(at: IndexPath(row: 0, section: CellType.current.rawValue)) as? CurrentCell {
            cell.update(with: weatherData)
        }
    }
}

