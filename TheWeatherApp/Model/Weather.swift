import Foundation

// MARK: - Weather
struct Weather: Codable {
    let nowDateTime: String
    let info: Info
    let geoObject: GeoObject
    let fact: Fact
    let forecasts: [Forecast]

    enum CodingKeys: String, CodingKey {
        case nowDateTime = "now_dt"
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
    let daytime: String
    //let accumPrec: [String: Double]?
//    let soilMoisture: Double
//    let soilTemp: Int
    let uvIndex: Double
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case icon
        case cloudness
        case condition
        case windSpeed = "wind_speed"
        case daytime
        //case accumPrec = "accum_prec"
//        case soilMoisture = "soil_moisture"
//        case soilTemp = "soil_temp"
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
    let source: String
    let tempMin: Int?
    let tempMax: Int?
    let tempAvg: Int?
    let windSpeed: Double
    let cloudness: Double
    let humidity: Int
    let precipitation: Int
    let icon: String
    let condition: String
    let uvIndex: Int?
    let feelsLike: Int
    let daytime: String
    let temp: Int?

    enum CodingKeys: String, CodingKey {
        case source = "_source"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case tempAvg = "temp_avg"
        case windSpeed = "wind_speed"
        case humidity
        case precipitation = "prec_prob"
        case cloudness
        case icon
        case condition
        case uvIndex = "uv_index"
        case feelsLike = "feels_like"
        case daytime
        case temp
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
    let morning: Day
    let day: Day
    let evening: Day
    let night: Day
    
    enum CodingKeys: String, CodingKey {
        case dayShort = "day_short"
        case nightShort = "night_short"
        case morning
        case day
        case evening
        case night
    }
}

// MARK: - GeoObject
struct GeoObject: Codable {
    let district: Country
    let locality: Country
    let province: Country
    let country: Country
}

// MARK: - Country
struct Country: Codable {
    let id: Int
    let name: String
}

// MARK: - Info
struct Info: Codable {
    let url: String
    let lat: Double
    let lon: Double
    let tzinfo: Tzinfo

    enum CodingKeys: String, CodingKey {
        case url
        case lat
        case lon
        case tzinfo
    }
}

// MARK: - Tzinfo
struct Tzinfo: Codable {
    let name: String
    let abbr: String
}
