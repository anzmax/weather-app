import CoreLocation
import Foundation

class LocationManagerService: NSObject {
    
    private let locationManager = CLLocationManager()
    
    var onLocationUpdated: ((CLLocation)->())?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
        startUpdatingLocation()
    }
    
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
