//
//  CountryModel+CoreDataClass.swift
//  TheWeatherApp
//
//  Created by Lika Maksimovic on 25.12.2023.
//
//

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

