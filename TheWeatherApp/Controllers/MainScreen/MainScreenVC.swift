import UIKit
import CoreLocation

class MainScreenVC: UIViewController {
    
    private let mainScreenView = MainScreenView()
    private let coordinator: AppCoordinator
    //var currentLocation: CLLocation?
    var currentWeather: Weather?
    
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
        buttonAction()
        if let currentWeather {
            mainScreenView.update(currentWeather)
        }
    }
    
    func setupBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(settingsButtonTapped(_:)))
        navigationItem.leftBarButtonItem?.tintColor = .customBlack
    }
    
    //MARK: - Action
    @objc func settingsButtonTapped(_ sender: UIBarButtonItem) {
        coordinator.showSettingsViewController()
    }
    
    func buttonAction() {
        mainScreenView.onButtonTapped = { [weak self] indexPath in
            guard let currentWeather = self?.currentWeather else { return }
            self?.coordinator.showDailyForecastVC(with: currentWeather)
        }
        
        mainScreenView.actionButtonTapped = { [weak self] indexPath in
            guard let currentWeather = self?.currentWeather else { return }
            self?.coordinator.showCurrentDayVC(with: currentWeather)
        }
    }
}

