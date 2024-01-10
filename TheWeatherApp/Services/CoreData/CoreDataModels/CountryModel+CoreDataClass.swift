import Foundation
import CoreData

@objc(CountryModel)
public class CountryModel: NSManagedObject {

}

extension CountryModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountryModel> {
        return NSFetchRequest<CountryModel>(entityName: "CountryModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var geoCountry: GeoObjectModel?
    @NSManaged public var geoLocality: GeoObjectModel?

}

extension CountryModel : Identifiable {

}

