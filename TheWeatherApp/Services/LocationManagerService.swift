import CoreLocation
import Foundation

protocol LocationManagerServiceDelegate: AnyObject {
    
    //вызывается при изменении статуса авторизации геолокации
    func didChangeAuthorization(status: CLAuthorizationStatus)
}

class LocationManagerService: NSObject {
    
    static let shared = LocationManagerService()
    
    //управление службами геолокации
    private let locationManager = CLLocationManager()
    
    weak var delegate: LocationManagerServiceDelegate?
    
    private override init() {
        super.init()
        locationManager.delegate = self
    }
    
    //метод для запроса разрешения пользователя на использование геолокации при использовании приложения
    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    //метод для начала процесса получения обновлений о местоположении пользователя
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
}

extension LocationManagerService: CLLocationManagerDelegate {
    
    //уведомление делегата о смене статуса
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        delegate?.didChangeAuthorization(status: status)
    }
    
    //вызывается при получении новых данных о местоположении
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}
