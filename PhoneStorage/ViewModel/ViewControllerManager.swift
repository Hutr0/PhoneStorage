//
//  ViewControllerManager.swift
//  PhoneStorage
//
//  Created by Леонид Лукашевич on 27.09.2022.
//

import Foundation
import CoreData

class ViewControllerManager: MobileStorage {
    
    var context: NSManagedObjectContext!
    
    var mobile = [NSManagedObject]()
    
    func getAll() -> Set<Mobile> {
        var setMobiles = Set<Mobile>()
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "MobileEntity")
        
        do {
            let fetchedResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            for object in fetchedResults {
                setMobiles.insert(Mobile(imei: object.value(forKey: "imei") as! String,
                                         model: object.value(forKey: "model") as! String))
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return setMobiles
    }
    
    func findByImei(_ imei: String) -> Mobile? {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "MobileEntity")
        
        do {
            let fetchedResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            for object in fetchedResults {
                if object.value(forKey: "imei") as? String == imei {
                    return Mobile(imei: object.value(forKey: "imei") as! String,
                                  model: object.value(forKey: "model") as! String)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    func save(_ mobile: Mobile) throws -> Mobile {
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "MobileEntity")
        
        do {
            let fetchedResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            for object in fetchedResults {
                if object.value(forKey: "imei") as? String == mobile.imei {
                    print("Current imei is already use.")
                    return Mobile(imei: "", model: "")
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        let entity =  NSEntityDescription.entity(forEntityName: "MobileEntity", in: context)
        let mobiles = NSManagedObject(entity: entity!, insertInto: context)
        mobiles.setValue(mobile.imei, forKey: "imei")
        mobiles.setValue(mobile.model, forKey: "model")
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return Mobile(imei: mobiles.value(forKey: "imei") as! String, model: mobiles.value(forKey: "model") as! String)
    }
    
    func delete(_ product: Mobile) throws {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "MobileEntity")
         
        do {
            let fetchedResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            for object in fetchedResults {
                print(object)
                if object.value(forKey: "imei") as? String == product.imei &&
                    object.value(forKey: "model") as? String == product.model {
                    context.delete(object)
                }
            }
            
            do {
                try context.save()
            } catch let error as NSError {
                throw error
            }
        } catch {
            throw error
        }
    }
    
    func exists(_ product: Mobile) -> Bool {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "MobileEntity")
        
        do {
            let fetchedResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            for object in fetchedResults {
                if object.value(forKey: "imei") as? String == product.imei {
                    return true
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return false
    }
}
