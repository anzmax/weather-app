//
//  PartsModel+CoreDataClass.swift
//  TheWeatherApp
//
//  Created by Lika Maksimovic on 25.12.2023.
//
//

import Foundation
import CoreData

@objc(PartsModel)
public class PartsModel: NSManagedObject {

}

extension PartsModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PartsModel> {
        return NSFetchRequest<PartsModel>(entityName: "PartsModel")
    }

    @NSManaged public var dayShort: DayModel?
    @NSManaged public var forecasts: NSSet?
    @NSManaged public var nightShort: DayModel?

}

// MARK: Generated accessors for forecasts
extension PartsModel {

    @objc(addForecastsObject:)
    @NSManaged public func addToForecasts(_ value: ForecastModel)

    @objc(removeForecastsObject:)
    @NSManaged public func removeFromForecasts(_ value: ForecastModel)

    @objc(addForecasts:)
    @NSManaged public func addToForecasts(_ values: NSSet)

    @objc(removeForecasts:)
    @NSManaged public func removeFromForecasts(_ values: NSSet)

}

extension PartsModel : Identifiable {

}
