import CoreLocation
import Foundation

class LocationManagerService: NSObject {
    
    private let locationManager = CLLocationManager()
    
    var onLocationUpdated: ((CLLocation)->())?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    //метод для запроса разрешения пользователя на использование геолокации при использовании приложения
    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
        
        startUpdatingLocation()
    }
    
    //метод для начала процесса получения обновлений о местоположении пользователя
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
}

extension LocationManagerService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Статус авторизации изменился: \(status)")
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            
            print(location.coordinate.latitude, location.coordinate.longitude)
            onLocationUpdated?(location)
        }
        print(locations)
    }
}
