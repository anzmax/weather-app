import Foundation
import CoreData

@objc(InfoModel)
public class InfoModel: NSManagedObject {

}

extension InfoModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InfoModel> {
        return NSFetchRequest<InfoModel>(entityName: "InfoModel")
    }

    @NSManaged public var lat: Double
    @NSManaged public var lon: Double
    @NSManaged public var weatherModel: WeatherModel?

}

extension InfoModel : Identifiable {

}
