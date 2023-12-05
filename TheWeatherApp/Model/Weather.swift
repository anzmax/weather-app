import Foundation

// MARK: - Weather
struct Weather: Codable {
    let nowDateTime: String
    let info: Info
    let geoObject: GeoObject
    let fact: Fact
    let forecasts: [Forecast]
    //let now: Int
    //let yesterday: Yesterday

    enum CodingKeys: String, CodingKey {
        case nowDateTime = "now_dt"
        case info
        case fact
        case geoObject = "geo_object"
        case forecasts
        //case now
        //case yesterday
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
    let accumPrec: [String: Double]
    let soilMoisture: Double
    let soilTemp: Int
    let uvIndex: Double
    let humidity: Int
    //let obsTime, uptime: Int
    //let precType, precProb: Int
    //let precStrength: Double
    //let isThunder: Bool
    //let windDir: String
    //let pressureMm, pressurePa: Int
    //let polar: Bool
    //let season, source: String
    //let windGust: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case icon
        case cloudness
        case condition
        case windSpeed = "wind_speed"
        case daytime
        case accumPrec = "accum_prec"
        case soilMoisture = "soil_moisture"
        case soilTemp = "soil_temp"
        case uvIndex = "uv_index"
        case humidity
        //case obsTime = "obs_time"
        //case uptime
        //case precType = "prec_type"
        //case precProb = "prec_prob"
        //case precStrength = "prec_strength"
        //case isThunder = "is_thunder"
        //case windDir = "wind_dir"
        //case pressureMm = "pressure_mm"
        //case pressurePa = "pressure_pa"
        //case source
        //case polar, season
        //case windGust = "wind_gust"
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
    //let biomet: Biomet?
    //let dateTs, week: Int
    //let moonCode: Int
    //let moonText: String


    enum CodingKeys: String, CodingKey {
        case date
        case sunrise
        case sunset
        case riseBegin = "rise_begin"
        case setEnd = "set_end"
        case parts
        case hours
        //case biomet
        //case dateTs = "date_ts"
        //case week
        //case moonCode = "moon_code"
        //case moonText = "moon_text"
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
    //let windGust: Double
    //let windDir: String
    //let pressureMm, pressurePa: Int
    //let soilTemp: Int
    //let soilMoisture, precMm: Double
    //let precPeriod, precType: Int
    //let precStrength: Double
    //let polar: Bool
    //let freshSnowMm: Double

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
        //case windGust = "wind_gust"
        //case windDir = "wind_dir"
        //case pressureMm = "pressure_mm"
        //case pressurePa = "pressure_pa"
        //case soilTemp = "soil_temp"
        //case soilMoisture = "soil_moisture"
        //case precMm = "prec_mm"
        //case precPeriod = "prec_period"
        //case precType = "prec_type"
        //case precStrength = "prec_strength"
        //case polar
        //case freshSnowMm = "fresh_snow_mm"
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
    //let hourTs: Int
    //let precType: Int
    //let precStrength: Double
    //let isThunder: Bool
    //let windDir: String
    //let windGust: Double
    //let pressureMm, pressurePa: Int
    //let soilTemp: Int?
    //let soilMoisture: Double?
    //let precMm: Double
    //let precPeriod: Int

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
        //case hourTs = "hour_ts"
        //case precType = "prec_type"
        //case precStrength = "prec_strength"
        //case isThunder = "is_thunder"
        //case windDir = "wind_dir"
        //case windGust = "wind_gust"
        //case pressureMm = "pressure_mm"
        //case pressurePa = "pressure_pa"
        //case soilTemp = "soil_temp"
        //case soilMoisture = "soil_moisture"
        //case precMm = "prec_mm"
        //case precPeriod = "prec_period"
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
    //let n: Bool
    //let geoid: Int
    //let defPressureMm, defPressurePa: Int
    //let slug: String
    //let zoom: Int
    //let nr, ns, nsr, p: Bool
    //let f, h: Bool

    enum CodingKeys: String, CodingKey {
        case url
        case lat
        case lon
        case tzinfo
        //case n
        //case geoid
        //case defPressureMm = "def_pressure_mm"
        //case defPressurePa = "def_pressure_pa"
        //case slug, zoom, nr, ns, nsr, p, f
        //case h = "_h"
    }
}

// MARK: - Tzinfo
struct Tzinfo: Codable {
    let name: String
    let abbr: String
    //let dst: Bool
    //let offset: Int
}

// MARK: - Yesterday
//struct Yesterday: Codable {
//    let temp: Int
//}

// MARK: - Biomet
//struct Biomet: Codable {
//    let index: Int
//    let condition: String
//}

//MARK: - Enums
//enum Condition: String, Codable {
//    case lightSnow = "light-snow"
//    case snow = "snow"
//    case wetSnow = "wet-snow"
//}
//
//enum WindDirEnum: String, Codable {
//    case e = "e"
//    case n = "n"
//    case ne = "ne"
//    case nw = "nw"
//    case s = "s"
//    case se = "se"
//    case sw = "sw"
//    case w = "w"
//}
//
//enum Icon: String, Codable {
//    case iconOvcSn = "ovc_sn"
//    case ovcRaSn = "ovc_ra_sn"
//    case ovcSn = "ovc_-sn"
//    case purpleOvcSn = "ovc_+sn"
//}

//enum PurpleDaytime: String, Codable {
//    case day = "d"
//    case night = "n"
//}
