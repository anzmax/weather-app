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
        
        locationService.onLocationUpdated = { [weak self] location in
            print("Получено местоположение: \(location)")
            
            self?.geocodeService.getPlace(for: location) { placeName in
                DispatchQueue.main.async {
                    self?.coordinator.showMainViewController(with: placeName)
                }
            }
        }

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


