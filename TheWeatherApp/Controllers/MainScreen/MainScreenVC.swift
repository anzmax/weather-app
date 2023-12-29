import UIKit
import CoreLocation

class MainScreenVC: UIViewController {
    
    let mainScreenView = MainScreenView()
    private let coordinator: AppCoordinator
    var currentWeather: WeatherModel? {
        didSet {
            
            if let currentWeather {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.mainScreenView.update(currentWeather)
                }
            }
        }
    }
    
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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let currentWeather {
            mainScreenView.update(currentWeather)
        }
    }
    
    //MARK: - Action
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

