import UIKit

enum WeatherCondition: String {
    case clear = "clear"
    case partlyCloudy = "partly-cloudy"
    case cloudy = "cloudy"
    case overcast = "overcast"
    case drizzle = "drizzle"
    case lightRain = "light-rain"
    case rain = "rain"
    case moderateRain = "moderate-rain"
    case heavyRain = "heavy-rain"
    case showers = "showers"
    case lightSnow = "light-snow"
    case snow = "snow"
    case wetSnow = "wet-snow"
    case snowShowers = "snow-showers"
    case hail
    case thunderstorm
    case thunderstormRain = "thunderstorm-with-rain"
    case thunderstormHail = "thunderstorm-with-hail"

    var ruDescription: String {
        switch self {
        case .clear:
            return "Ясно".localized
        case .partlyCloudy:
            return "Малооблачно".localized
        case .cloudy:
            return "Облачно с прояснениями".localized
        case .overcast:
            return "Пасмурно".localized
        case .drizzle:
            return "Морось".localized
        case .lightRain:
            return "Небольшой дождь".localized
        case .rain:
            return "Дождь".localized
        case .moderateRain:
            return "Умеренно сильный дождь".localized
        case .heavyRain:
            return "Сильный дождь".localized
        case .showers:
            return "Ливень".localized
        case .lightSnow:
            return "Небольшой снег".localized
        case .snow:
            return "Снег".localized
        case .wetSnow:
            return "Дождь со снегом".localized
        case .snowShowers:
            return "Снегопад".localized
        case .hail:
            return "Град".localized
        case .thunderstorm:
            return "Гроза".localized
        case .thunderstormRain:
            return "Дождь с грозой".localized
        case .thunderstormHail:
            return "Гроза с градом".localized
        }
    }
}

func imageForWeatherCondition(_ condition: WeatherCondition) -> UIImage? {
    switch condition {
    case .clear:
        return UIImage(named: "bigsun")
    case .partlyCloudy:
        return UIImage(named: "sunny")
    case .cloudy:
        return UIImage(named: "sunny")
    case .overcast:
        return UIImage(named: "rainy")
    case .drizzle:
        return UIImage(named: "rainy")
    case .lightRain:
        return UIImage(named: "rainy")
    case .rain:
        return UIImage(named: "rainy")
    case .moderateRain:
        return UIImage(named: "rainy")
    case .heavyRain:
        return UIImage(named: "rainy")
    case .showers:
        return UIImage(named: "rainy")
    case .lightSnow:
        return UIImage(named: "snowflake")
    case .snow:
        return UIImage(named: "snowflake")
    case .wetSnow:
        return UIImage(named: "snowflake")
    case .snowShowers:
        return UIImage(named: "snowflake")
    case .hail:
        return UIImage(named: "snowflake")
    case .thunderstorm:
        return UIImage(named: "thunder")
    case .thunderstormRain:
        return UIImage(named: "thunder")
    case .thunderstormHail:
        return UIImage(named: "thunder")
    }
}
