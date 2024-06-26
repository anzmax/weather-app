import Foundation
import UIKit

class WeatherService {
    
    static let shared = WeatherService()
    
    func fetchWeather(latitude: Double, longitude: Double, completion: @escaping (Result<Weather, Error>) -> Void) {
        
        let jsonDecoder = JSONDecoder()
        
        let API_KEY = "7676e373-fc87-4b1b-b8c4-2ac9b67a317a"
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)&lang=ru_RU&limit=7&hours=true&extra=true"
        
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            
            request.addValue(API_KEY, forHTTPHeaderField: "X-Yandex-API-Key")
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Ошибка запроса: \(error)")
                    return
                }
                
                if let data = data {
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print(jsonString)
                    }
                    
                    do {
                        let weather = try jsonDecoder.decode(Weather.self, from: data)
                        print(weather)
                        DispatchQueue.main.async {
                            completion(.success(weather))
                        }
                    }
                    catch {
                        print(error)
                    }
                }
            }
            
            task.resume()
        } else {
            print("Некорректный URL")
        }
    }
}
