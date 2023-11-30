import UIKit

//class WeatherService {
//    static let shared = WeatherService()
//    
//    func fetchCurrentWeather(latitude: Double, longitude: Double, completion: @escaping (Result<WeatherData, Error>) -> Void) {
//        let urlString = "https://weatherapi-com.p.rapidapi.com/current.json?q=53.1%2C-0.13"
//        guard let url = URL(string: urlString) else {
//            completion(.failure(URLError(.badURL)))
//            return
//        }
//        
//        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.setValue("3316aef2d2msh4d5ccc17f2d068ep1ed31bjsn45ced2deba00", forHTTPHeaderField: "X-RapidAPI-Key")
//        request.setValue("weatherapi-com.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
//        
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(URLError(.badServerResponse)))
//                return
//            }
//            
//            do {
//                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
//                completion(.success(weatherData))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//        
//        dataTask.resume()
//    }
//}

import Foundation

class WeatherService {
    
    static let shared = WeatherService()
    
    func fetchWeather(latitude: Double, longitude: Double, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        let session = URLSession.shared
        
        if let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(latitude.description)&lon=\(longitude.description)&units=metric&lang=ru&exclude=hourly,daily&appid=b36a62334435e6536855534982102e75") {
            
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let weatherData = try decoder.decode(WeatherData.self, from: data)
                        completion(.success(weatherData))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }
    }
}



//class WeatherService {
//    
//    func fetchWeather(latitude: Double, longitude: Double) {
//        
//        let session = URLSession.shared
//        
//        if let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&lang=ru&exclude=hourly,daily&units=metric&appid=b36a62334435e6536855534982102e75") {
//            
//            let task = session.dataTask(with: url) { data, response, error in
//                if let error = error {
//                    print("Data task error: \(error.localizedDescription)")
//                    return
//                }
//                
//                if let data = data {
//                    do {
//                        let decoder = JSONDecoder()
//                        let weatherData = try decoder.decode(WeatherData.self, from: data)
//                        print("\(weatherData)")
//                    } catch {
//                        print(error.localizedDescription)
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//}
