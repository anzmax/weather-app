import CoreData
import UIKit

class CoreDataService {
    
    private let persistentContainer: NSPersistentContainer
    private var context: NSManagedObjectContext { persistentContainer.viewContext }
    
    init(modelName: String = "WeatherCoreData") {
        self.persistentContainer = NSPersistentContainer(name: .dataName)
        persistentContainer.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Не удалось загрузить хранилища: \(error), \(error.userInfo)")
            }
        }
    }

    func saveWeather(weather: Weather) {
            let weatherModel = WeatherModel(context: context)
            weatherModel.info = createInfoModel(info: weather.info)
            weatherModel.geoObject = createGeoObjectModel(geoObject: weather.geoObject)
            weatherModel.fact = createFactModel(fact: weather.fact)
            
            var forecasts: [ForecastModel] = []
            for forecast in weather.forecasts {
                let model = createForecastModel(forecast: forecast)
                forecasts.append(model)
                break
            }
            
            weatherModel.forecasts = NSSet(array: forecasts)

            do {
                try context.save()
            } catch {
                print("Ошибка при сохранении: \(error)")
            }
        }
    
    private func createInfoModel(info: Info) -> InfoModel {
        let model = InfoModel(context: context)
        model.lat = info.lat
        model.lon = info.lon
        return model
    }
    
    private func createGeoObjectModel(geoObject: GeoObject) -> GeoObjectModel {
        let model = GeoObjectModel(context: context)
        model.locality = createCountryModel(country: geoObject.locality)
        model.country = createCountryModel(country: geoObject.country)
        return model
    }
    
    private func createCountryModel(country: Country) -> CountryModel {
        let model = CountryModel(context: context)
        model.name = country.name
        return model
    }
    
    private func createFactModel(fact: Fact) -> FactModel {
        let model = FactModel(context: context)
        model.temp = Int32(fact.temp)
        model.feelsLike = Int32(fact.feelsLike)
        model.icon = fact.icon
        model.cloudness = fact.cloudness
        model.condition = fact.condition
        model.windSpeed = fact.windSpeed
        model.uvIndex = fact.uvIndex
        model.humidity = Int32(fact.humidity)
        return model
    }
    
    private func createForecastModel(forecast: Forecast) -> ForecastModel {
        let model = ForecastModel(context: context)
        model.date = forecast.date
        model.sunrise = forecast.sunrise
        model.sunset = forecast.sunset
        model.riseBegin = forecast.riseBegin
        model.setEnd = forecast.setEnd
        model.parts = createPartsModel(parts: forecast.parts)
        model.hours = NSSet(array: forecast.hours.map { createHourModel(hour: $0) })
        return model
    }
    
    private func createPartsModel(parts: Parts) -> PartsModel {
        let model = PartsModel(context: context)
        model.dayShort = createDayModel(day: parts.dayShort)
        model.nightShort = createDayModel(day: parts.nightShort)
        return model
    }
    
    private func createDayModel(day: Day) -> DayModel {
        let model = DayModel(context: context)
        model.temp = Int32(day.temp ?? 0)
        model.tempMin = Int32(day.tempMin ?? 0)
        model.tempMax = Int32(day.tempMax ?? 0)
        model.windSpeed = day.windSpeed
        model.cloudness = day.cloudness
        model.humidity = Int32(day.humidity)
        model.precipitation = Int32(day.precipitation)
        model.icon = day.icon
        model.condition = day.condition
        model.uvIndex = Int32(day.uvIndex ?? 0)
        model.feelsLike = Int32(day.feelsLike)
        return model
    }
    
    private func createHourModel(hour: Hour) -> HourModel {
        let model = HourModel(context: context)
        model.hour = hour.hour
        model.temp = Int32(hour.temp)
        model.feelsLike = Int32(hour.feelsLike)
        model.icon = hour.icon
        model.condition = hour.condition
        model.cloudness = hour.cloudness
        model.windSpeed = hour.windSpeed
        model.humidity = Int32(hour.humidity)
        model.uvIndex = Int32(hour.uvIndex)
        model.precipitation = Int32(hour.precipitation)
        return model
    }
    
    func fetchWeather() -> [WeatherModel] {
        let fetchRequest: NSFetchRequest<WeatherModel> = WeatherModel.fetchRequest()
        
        do {
            let weatherModels = try context.fetch(fetchRequest)
            return weatherModels
        } catch {
            print("Ошибка при извлечении данных: \(error)")
            return []
        }
    }
    
    func deleteWeatherByLocalitiy(localityName: String) {
        
        let fetchRequest: NSFetchRequest<WeatherModel> = WeatherModel.fetchRequest()
    
        do {
            let weatherModels = try context.fetch(fetchRequest)
            
            for model in weatherModels {
                if model.geoObject?.locality?.name == localityName {
                    
                    context.delete(model)
                    try context.save()
                }
            }
            
        } catch {
            print("Ошибка при извлечении или удалении данных: \(error)")
        }
    }
}

extension String {
    static let dataName = "WeatherCoreData"
}
