import UIKit
import CoreLocation

class MainScreenVC: UIViewController {
    
    let mainScreenView = MainScreenView()
    private let coordinator: AppCoordinator
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
        //setupBarButton()
        
        if let currentWeather {
            mainScreenView.update(currentWeather)
        }
//        mainScreenView.pageControl.addTarget(self, action: #selector(pageControlChanged(_:)), for: .valueChanged)
    }

//    @objc private func pageControlChanged(_ sender: UIPageControl) {
//        pageChanged?(sender.currentPage)
//    }
    
//    func setupBarButton() {
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(settingsButtonTapped(_:)))
//        navigationItem.leftBarButtonItem?.tintColor = .customBlack
//        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "locationImage"), style: .plain, target: self, action: #selector(locationButtonTapped(_:)))
//        navigationItem.rightBarButtonItem?.tintColor = .customBlack
//    }
    
    //MARK: - Action
//    @objc func settingsButtonTapped(_ sender: UIBarButtonItem) {
//        coordinator.showSettingsViewController()
//    }
//    
//    @objc func locationButtonTapped(_ sender: UIBarButtonItem) {
//        coordinator.showListVC()
//    }
    
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

