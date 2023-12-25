import Foundation
import CoreData

@objc(HourModel)
public class HourModel: NSManagedObject {

}

extension HourModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HourModel> {
        return NSFetchRequest<HourModel>(entityName: "HourModel")
    }

    @NSManaged public var cloudness: Double
    @NSManaged public var condition: String?
    @NSManaged public var feelsLike: Int32
    @NSManaged public var hour: String?
    @NSManaged public var humidity: Int32
    @NSManaged public var icon: String?
    @NSManaged public var precipitation: Int32
    @NSManaged public var temp: Int32
    @NSManaged public var uvIndex: Int32
    @NSManaged public var windSpeed: Double
    @NSManaged public var forecasts: ForecastModel?

}

extension HourModel : Identifiable {

}
