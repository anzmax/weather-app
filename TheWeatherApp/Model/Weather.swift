import Foundation

struct WeatherData: Codable {
    var lat: Double = 0.0
    var lon: Double = 0.0
    var timezone: String = ""
    var timezone_offset: Int = 0
    var current: CurrentWeather = CurrentWeather()
}

struct CurrentWeather: Codable {
    var dt: Int = 0
    var sunrise: Int = 0
    var sunset: Int = 0
    var temp: Double = 0.0
    var feels_like: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
    var dew_point: Double = 0.0
    var uvi: Double = 0.0
    var clouds: Int = 0
    var wind_speed: Double = 0.0
    var wind_deg: Int = 0
    var wind_gust: Double = 0.0
    var weather: [WeatherDescription] = []
}

struct WeatherDescription: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
