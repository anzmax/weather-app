import Foundation
import CoreData

@objc(GeoObjectModel)
public class GeoObjectModel: NSManagedObject {

}

extension GeoObjectModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeoObjectModel> {
        return NSFetchRequest<GeoObjectModel>(entityName: "GeoObjectModel")
    }

    @NSManaged public var country: CountryModel?
    @NSManaged public var locality: CountryModel?
    @NSManaged public var weather: WeatherModel?

}

extension GeoObjectModel : Identifiable {

}
