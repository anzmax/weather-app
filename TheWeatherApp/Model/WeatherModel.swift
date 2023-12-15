
import Foundation

//Plain model
//Модель для сохранения в UserDefaults
struct WeatherModel {
    
    var latitude: Double
    var longitude: Double
    
    var country: String //страна
    var locality: String //город
    
    var forecasts: [Forecast]
    
    init(model: Weather) {
        
        self.latitude = model.info.lat
        self.longitude = model.info.lon
        self.locality =  "\(model.geoObject.locality.name)"
        self.country = "\(model.geoObject.country.name)"
        
        self.forecasts = model.forecasts
    }
}
