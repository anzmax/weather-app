import UIKit

class DailyForecastVC: UIViewController {
    
    private let dailyForecastView = DailyForecastView()
    private let coordinator: AppCoordinator
    var currentWeather: WeatherModel?
    
    override func loadView() {
        view = dailyForecastView
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
        dailyForecastView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        dailyForecastView.locationLabel.text = "\(currentWeather?.geoObject?.locality?.name ?? "")"
        
        if let forecastsSet = currentWeather?.forecasts as? Set<ForecastModel>,
           let firstForecast = forecastsSet.first,
           let hoursSet = firstForecast.hours as? Set<HourModel> {
            let hoursArray = Array(hoursSet)
            dailyForecastView.updateHour(hoursArray)
        }
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
