import CoreLocation
import UIKit

class OnboardingVC: UIViewController {
    
    private let onboardingView = OnboardingView()
    private let locationService = LocationManagerService.shared
    private let locationSearchService = LocationSearchService.shared
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
        locationService.delegate = self
        onboardingView.useGeoButton.addTarget(self, action: #selector(buttonTapped(button: )), for: .touchUpInside)
        onboardingView.dismissGeoButton.addTarget(self, action: #selector(buttonTapped(button: )), for: .touchUpInside)
    }
    
    @objc func buttonTapped(button: UIButton) {
        switch button {
        case onboardingView.useGeoButton:
            locationService.requestLocationAuthorization()
        case onboardingView.dismissGeoButton:
            coordinator.showAddLocationScreen()
        default:
            break
        }
    }
}

extension OnboardingVC: LocationManagerServiceDelegate {
    
    func didChangeAuthorization(status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            locationService.startUpdatingLocation()
        case .denied, .restricted:
            break
        case .notDetermined:
            break
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationSearchService.getPlace(for: location) { [weak self] placeName in
                DispatchQueue.main.async {
                    self?.coordinator.showMainViewController(with: placeName)
                }
            }
            manager.stopUpdatingLocation()
        }
    }
}
