import Foundation
import CoreData

@objc(FactModel)
public class FactModel: NSManagedObject {

}

extension FactModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FactModel> {
        return NSFetchRequest<FactModel>(entityName: "FactModel")
    }

    @NSManaged public var windSpeed: Double
    @NSManaged public var uvIndex: Double
    @NSManaged public var temp: Int32
    @NSManaged public var icon: String?
    @NSManaged public var humidity: Int32
    @NSManaged public var feelsLike: Int32
    @NSManaged public var condition: String?
    @NSManaged public var cloudness: Double
    @NSManaged public var weather: WeatherModel?

}

extension FactModel : Identifiable {

}
