import Foundation
import CoreData

@objc(ForecastModel)
public class ForecastModel: NSManagedObject {

}

extension ForecastModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ForecastModel> {
        return NSFetchRequest<ForecastModel>(entityName: "ForecastModel")
    }

    @NSManaged public var date: String?
    @NSManaged public var riseBegin: String?
    @NSManaged public var setEnd: String?
    @NSManaged public var sunrise: String?
    @NSManaged public var sunset: String?
    @NSManaged public var hours: NSSet?
    @NSManaged public var parts: PartsModel?
    @NSManaged public var weather: WeatherModel?

}

// MARK: Generated accessors for hours
extension ForecastModel {

    @objc(addHoursObject:)
    @NSManaged public func addToHours(_ value: HourModel)

    @objc(removeHoursObject:)
    @NSManaged public func removeFromHours(_ value: HourModel)

    @objc(addHours:)
    @NSManaged public func addToHours(_ values: NSSet)

    @objc(removeHours:)
    @NSManaged public func removeFromHours(_ values: NSSet)

}

extension ForecastModel : Identifiable {

}
