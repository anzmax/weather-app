import Foundation
import CoreData

@objc(WeatherModel)
public class WeatherModel: NSManagedObject {

}

extension WeatherModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherModel> {
        return NSFetchRequest<WeatherModel>(entityName: "WeatherModel")
    }

    @NSManaged public var fact: FactModel?
    @NSManaged public var forecasts: NSSet?
    @NSManaged public var geoObject: GeoObjectModel?
    @NSManaged public var info: InfoModel?

}

// MARK: Generated accessors for forecasts
extension WeatherModel {

    @objc(addForecastsObject:)
    @NSManaged public func addToForecasts(_ value: ForecastModel)

    @objc(removeForecastsObject:)
    @NSManaged public func removeFromForecasts(_ value: ForecastModel)

    @objc(addForecasts:)
    @NSManaged public func addToForecasts(_ values: NSSet)

    @objc(removeForecasts:)
    @NSManaged public func removeFromForecasts(_ values: NSSet)

}

extension WeatherModel : Identifiable {

}
