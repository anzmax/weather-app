import CoreLocation

class GeocodeService {
    
    static let shared = GeocodeService()
    private let geocoder = CLGeocoder()
    
    private init() {}
    
    func searchLocation(by query: String, completion: @escaping (CLPlacemark?) -> Void) {
        geocoder.cancelGeocode()
        
        geocoder.geocodeAddressString(query, in: nil, preferredLocale: Locale.current) { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            if let placemark = placemarks?.first {
                completion(placemark)
            } else {
                completion(nil)
            }
        }
    }
}
