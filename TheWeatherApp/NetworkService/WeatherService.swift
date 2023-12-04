import Foundation
import UIKit

//class WeatherService {
//    
//    static let shared = WeatherService()
//    
//    func fetchWeather(latitude: Double, longitude: Double, completion: @escaping (Result<WeatherData, Error>) -> Void) {
//        let session = URLSession.shared
//        
//        if let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(latitude.description)&lon=\(longitude.description)&units=metric&lang=ru&exclude=hourly,daily&appid=b36a62334435e6536855534982102e75") {
//            
//            let task = session.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    completion(.failure(error))
//                    return
//                }
//                
//                if let data = data {
//                    do {
//                        let decoder = JSONDecoder()
//                        let weatherData = try decoder.decode(WeatherData.self, from: data)
//                        completion(.success(weatherData))
//                    } catch {
//                        completion(.failure(error))
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//}
//

class WeatherService {
    
    static let shared = WeatherService()
    
    func fetchWeather(latitude: Double, longitude: Double, completion: @escaping (Result<Weather, Error>) -> Void) {
        
        let jsonDecoder = JSONDecoder()
        
        let API_KEY = "acc18e80-17fe-4fa1-896a-90236f0d3278"
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
                        completion(.success(weather))
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
