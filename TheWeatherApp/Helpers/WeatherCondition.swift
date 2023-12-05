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
            return "Ясно"
        case .partlyCloudy:
            return "Малооблачно"
        case .cloudy:
            return "Облачно с прояснениями"
        case .overcast:
            return "Пасмурно"
        case .drizzle:
            return "Морось"
        case .lightRain:
            return "Небольшой дождь"
        case .rain:
            return "Дождь"
        case .moderateRain:
            return "Умеренно сильный дождь"
        case .heavyRain:
            return "Сильный дождь"
        case .showers:
            return "Ливень"
        case .lightSnow:
            return "Небольшой снег"
        case .snow:
            return "Снег"
        case .wetSnow:
            return "Дождь со снегом"
        case .snowShowers:
            return "Снегопад"
        case .hail:
            return "Град"
        case .thunderstorm:
            return "Гроза"
        case .thunderstormRain:
            return "Дождь с грозой"
        case .thunderstormHail:
            return "Гроза с градом"
        }
    }
}

