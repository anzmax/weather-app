import UIKit

final class LocationsArchiver {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "Locations"

    func save(_ locations: [Location]) {

        do {
            let data = try encoder.encode(locations)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }

    func fetch() -> [Location] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            let array = try decoder.decode(Array<Location>.self, from: data)
            return array
        } catch {
            print(error)
        }
        return []
    }
    
    func deleteLocations() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
