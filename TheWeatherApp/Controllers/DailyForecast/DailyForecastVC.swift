import UIKit

class DailyForecastVC: UIViewController {
    
    private let twentyFourHourView = DailyForecastView()
    private let coordinator: AppCoordinator
    
    override func loadView() {
        view = twentyFourHourView
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
        twentyFourHourView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
