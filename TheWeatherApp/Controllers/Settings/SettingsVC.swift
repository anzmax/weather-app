import UIKit

class SettingsVC: UIViewController {
    
    private let settingsView = SettingsView()
    private let coordinator: AppCoordinator

    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = settingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        settingsView.acceptSettingsButton.addTarget(self, action: #selector(acceptSettingsButton), for: .touchUpInside)
    }

    @objc func acceptSettingsButton() {
 
    }
}
