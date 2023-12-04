import UIKit

class CurrentDayVC: UIViewController {
    
    private let currentDayView = CurrentDayView()
    var currentWeather: Weather?
    
    override func loadView() {
        view = currentDayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentDayView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        currentDayView.locationLabel.text = "\(currentWeather?.geoObject.locality.name ?? "")"
        
        currentDayView.update(currentWeather?.forecasts ?? [])
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
