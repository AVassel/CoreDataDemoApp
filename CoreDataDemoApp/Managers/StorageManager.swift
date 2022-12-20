//
//  StorageManager.swift
//  CoreDataDemoApp
//
//  Created by Anton Vassel on 07.12.2022.
//

import CoreData

class StorageManager {
    static let shared = StorageManager()
    
    // MARK: - Core Data stack
    
    private var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreDataDemoApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {
    }
    
    // MARK: - Public Methods
    
    func fetchData(completion: (Result<[Task], Error>) -> Void) {
        let fetchRequest = Task.fetchRequest()
        
        do {
            let tasks = try viewContext.fetch(fetchRequest)
            completion(.success(tasks))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func saveTask(taskName: String, completion: (Task) -> Void) {
        let task = Task(context: viewContext)
        task.title = taskName
        completion(task)
        saveContext()
    }
    
    func editTask(task: Task, taskName: String) {
        task.title = taskName
        saveContext()
    }
    
    func deleteTask(task: Task) {
        viewContext.delete(task)
        saveContext()
    }
    
    //MARK: - Core Data Saving support
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nseerror = error as NSError
                fatalError("Unresolved error \(nseerror), \(nseerror.userInfo) ")
            }
        }
    }
    
}
