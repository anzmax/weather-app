import UIKit
import CoreLocation

final class AppCoordinator {
    
    private var navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func startApplication() {
        showOnboardingScreen()
    }
    
    func showOnboardingScreen() {
        let vc = OnboardingVC(coordinator: self)
        navigation.setViewControllers([vc], animated: true)
    }
    
    func showAddLocationScreen() {
        let vc = AddLocationVC(coordinator: self)
        navigation.pushViewController(vc, animated: true)
    }
    
    func showSearchLocationScreen() {
        let vc = SearchLocationVC(coordinator: self)
        navigation.present(vc, animated: true)
    }
    
//    func showMainViewController(with location: String?) {
//         let vc = MainScreenVC(coordinator: self)
//         //vc.currentLocation = location
//         vc.title = location ?? "Неизвестное местоположение"
//         navigation.setViewControllers([vc], animated: true)
//     }
//    
    
    func showMainViewController(with latitude: Double, longitude: Double) {
        let vc = MainScreenVC(coordinator: self)
        vc.currentLocation = CLLocation(latitude: latitude, longitude: longitude)
        vc.title = "Долгота: \(longitude), Широта: \(latitude)"
        navigation.setViewControllers([vc], animated: true)
    }
    
    func showSettingsViewController() {
        let vc = SettingsVC(coordinator: self)
        navigation.present(vc, animated: true)
    }
    
    func showTwentyFourHourVC() {
        let vc = DailyForecastVC(coordinator: self)
        vc.modalPresentationStyle = .fullScreen
        navigation.present(vc, animated: true)
    }
    
}
