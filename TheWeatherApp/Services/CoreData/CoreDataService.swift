import CoreData
import UIKit

class CoreDataService {
    
    static let shared = CoreDataService()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: .dataName)
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        return container
        
    }()
    
    func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
        let context = backgroundContext ?? persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
                assertionFailure("Saving error")
            }
        }
    }
    
//    
//    func fetchLocations() -> [LocationModel] {
//        let context = persistentContainer.viewContext
//        let fetchRequest: NSFetchRequest<LocationModel> = LocationModel.fetchRequest()
//        
//        do {
//            let locationModel = try context.fetch(fetchRequest)
//            return locationModel.map { locationModel in
//  
//                locationModel.name = 
//            }
//        } catch {
//            print("Ошибка при извлечении : \(error)")
//            return []
//        }
//    }
    
//    func deleteFavoritePost(post: Post, context: NSManagedObjectContext) {
//        let fetchRequest: NSFetchRequest<PostModel> = PostModel.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "author == %@ AND descriptionText == %@", post.author, post.description)
//        
//        do {
//            let postModels = try context.fetch(fetchRequest)
//            if let postModelToDelete = postModels.first {
//                context.delete(postModelToDelete)
//                saveContext(backgroundContext: context)
//            }
//        } catch {
//            print("Ошибка при удалении избранного поста: \(error)")
//        }
//    }
}

extension String {
    static let dataName = "WeatherDataModel"
}
