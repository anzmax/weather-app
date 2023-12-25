//
//  DayModel+CoreDataClass.swift
//  TheWeatherApp
//
//  Created by Lika Maksimovic on 25.12.2023.
//
//

import Foundation
import CoreData

@objc(DayModel)
public class DayModel: NSManagedObject {

}

extension DayModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DayModel> {
        return NSFetchRequest<DayModel>(entityName: "DayModel")
    }

    @NSManaged public var windSpeed: Double
    @NSManaged public var uvIndex: Int32
    @NSManaged public var tempMin: Int32
    @NSManaged public var tempMax: Int32
    @NSManaged public var temp: Int32
    @NSManaged public var precipitation: Int32
    @NSManaged public var icon: String?
    @NSManaged public var humidity: Int32
    @NSManaged public var feelsLike: Int32
    @NSManaged public var condition: String?
    @NSManaged public var cloudness: Double
    @NSManaged public var partsDay: PartsModel?
    @NSManaged public var partsNight: PartsModel?

}

extension DayModel : Identifiable {

}
