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

    var russianDescription: String {
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
        }
    }
}

