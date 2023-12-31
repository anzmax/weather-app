import Foundation

// MARK: - Weather
struct Weather: Codable {
    let info: Info
    let geoObject: GeoObject
    let fact: Fact
    let forecasts: [Forecast]

    enum CodingKeys: String, CodingKey {
        case info
        case fact
        case geoObject = "geo_object"
        case forecasts
    }
}

// MARK: - Fact
struct Fact: Codable {
    let temp: Int
    let feelsLike: Int
    let icon: String
    let cloudness: Double
    let condition: String
    let windSpeed: Double
    let uvIndex: Double
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case icon
        case cloudness
        case condition
        case windSpeed = "wind_speed"
        case uvIndex = "uv_index"
        case humidity
    }
}

// MARK: - Forecast
struct Forecast: Codable {
    let date: String
    let sunrise: String
    let sunset: String
    let riseBegin: String
    let setEnd: String
    let parts: Parts
    let hours: [Hour]

    enum CodingKeys: String, CodingKey {
        case date
        case sunrise
        case sunset
        case riseBegin = "rise_begin"
        case setEnd = "set_end"
        case parts
        case hours
    }
}

// MARK: - Day
struct Day: Codable {
    let temp: Int?
    let tempMin: Int?
    let tempMax: Int?
    let windSpeed: Double
    let cloudness: Double
    let humidity: Int
    let precipitation: Int
    let icon: String
    let condition: String
    let uvIndex: Int?
    let feelsLike: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case windSpeed = "wind_speed"
        case humidity
        case precipitation = "prec_prob"
        case cloudness
        case icon
        case condition
        case uvIndex = "uv_index"
        case feelsLike = "feels_like"
    }
}


// MARK: - Hour
struct Hour: Codable {
    let hour: String
    let temp: Int
    let feelsLike: Int
    let icon: String
    let condition: String
    let cloudness: Double
    let windSpeed: Double
    let humidity: Int
    let uvIndex: Int
    let precipitation: Int

    enum CodingKeys: String, CodingKey {
        case hour
        case temp
        case feelsLike = "feels_like"
        case icon
        case condition
        case cloudness
        case windSpeed = "wind_speed"
        case humidity
        case uvIndex = "uv_index"
        case precipitation = "prec_prob"
    }
}

// MARK: - Parts
struct Parts: Codable {
    let dayShort: Day
    let nightShort: Day
    
    enum CodingKeys: String, CodingKey {
        case dayShort = "day_short"
        case nightShort = "night_short"
    }
}

// MARK: - GeoObject
struct GeoObject: Codable {
    let locality: Country
    let country: Country
}

// MARK: - Country
struct Country: Codable {
    let name: String
}

// MARK: - Info
struct Info: Codable {
    let lat: Double
    let lon: Double

    enum CodingKeys: String, CodingKey {
        case lat
        case lon
    }
}

