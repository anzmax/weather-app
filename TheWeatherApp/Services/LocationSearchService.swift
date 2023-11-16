import CoreLocation

class LocationSearchService {
    
    static let shared = LocationSearchService()
    private let geocoder = CLGeocoder()
    
    private init() {}
    
    func searchLocation(for query: String, completion: @escaping (String) -> Void) {
        geocoder.cancelGeocode()
        
        geocoder.geocodeAddressString(query) { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let placemark = placemarks?.first {
                let placeName = placemark.locality ?? ""
                let country = placemark.country ?? ""
                let administrativeArea = placemark.administrativeArea ?? ""
                let formattedString = "\(placeName), \(administrativeArea), \(country)"
                completion(formattedString)
            } else {
                completion("Местоположение не найдено")
            }
        }
    }
    
    func getPlace(for location: CLLocation, completion: @escaping (String?) -> Void) {
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let place = placemarks?.first, error == nil else {
                completion(nil)
                return
            }
            let placeName = place.locality ?? place.subLocality ?? "Неизвестное местоположение"
            completion(placeName)
        }
    }
}
