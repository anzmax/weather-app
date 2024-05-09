import Foundation

let locationTranslations: [String: String] = [
    "Москва": "Moscow",
    "Санкт-Петербург": "Saint Petersburg",
    "Лондон": "London",
    "Россия": "Russia",
    "Великобритания": "United Kingdom"
]

func translateLocationName(_ name: String) -> String {
    return locationTranslations[name] ?? name
}

