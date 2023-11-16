import UIKit

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
    
    func showMainViewController(with location: String?) {
         let vc = MainScreenVC()
         vc.title = location ?? "Неизвестное местоположение"
         navigation.setViewControllers([vc], animated: true)
     }
}
