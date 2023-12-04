import UIKit

class CurrentDayVC: UIViewController {
    
    private let currentDayView = CurrentDayView()
    
    override func loadView() {
        view = currentDayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentDayView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
