import CoreLocation
import UIKit

class OnboardingVC: UIViewController {
    
    private let onboardingView = OnboardingView()
    private let locationService = LocationManagerService()
    private let geocodeService = GeocodeService.shared
    private let coordinator: AppCoordinator
    
    override func loadView() {
        view = onboardingView
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
        onboardingView.useGeoButton.addTarget(self, action: #selector(buttonTapped(button: )), for: .touchUpInside)
        onboardingView.dismissGeoButton.addTarget(self, action: #selector(buttonTapped(button: )), for: .touchUpInside)
    }

    //MARK: - Action
    @objc func buttonTapped(button: UIButton) {
        switch button {
        case onboardingView.useGeoButton:
            handleUseGeoButtonTap()
        case onboardingView.dismissGeoButton:
            coordinator.showAddLocationScreen()
        default:
            break
        }
    }
    
    private func handleUseGeoButtonTap() {
        locationService.requestLocationAuthorization()
        locationService.onLocationUpdated = { [weak self] location in
            print("Получено местоположение: \(location)")
            
            WeatherService.shared.fetchWeather(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let weather):
                        
                        let latitude = weather.info.lat
                        let longitude = weather.info.lon
                        
                        print("Долгота: \(latitude), Широта: \(longitude)")
                        print(weather)
                        self?.coordinator.showMainViewController(with: weather)
                    case .failure(let error):
                        print("Ошибка при запросе погоды: \(error)")
                    }
                }
            }
        }
    }
}


