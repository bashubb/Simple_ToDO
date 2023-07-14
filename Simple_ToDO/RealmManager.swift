//
//  RealmManager.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTasks()
    }
    
    
    ///  Opens a new Realm Object
    func openRealm() {
        do {
            
            //Create a Realm Object
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
            
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    
    // MARK: CREATE
    
    /// Adds new task to the Realm
    func addTask(taskTitle: String) {
        //unwrap optional localRealm
        if let  localRealm = localRealm {
            do {
                
                // Try to add new Task to the realm object
                try localRealm.write {
                    let newTask = Task(value:["title": taskTitle, "completed": false] as [String : Any])
                    localRealm.add(newTask)
                    getTasks()
                    print("Added new task to Realm: \(newTask)")
                                       
                }
                
            } catch {
                // There is an error
                print("Error adding task to Realm: \(error)")
            }
        }
    }
    
    
    // MARK: READ
    
    ///Reads taks from Realm
    func getTasks() {
        
        // Unwrap localRealm
        if let localRealm {
            
            // Fetch tasks and sorted by 'completed' property
           let allTask =  localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            self.tasks = []
            
            // iterate in fetched tasks and add every single one to the published property
            for task in allTask {
                self.tasks.append(task)
            }
        }
    }
    
    // MARK: UPDATE
    
    ///Updates task
    func updateTast(id: ObjectId, completed: Bool) {
        
        // Unwrap localRealm
        if let localRealm = localRealm {
            do {
                
                // Find specific task by id
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !taskToUpdate.isEmpty else{return}
                
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    print("Updated task with id \(id)! Completed status: \(completed)")
                }
                
            } catch {
                print("Error updating the task: \(id) to Realm : \(error)")
            }
        }
    }
    // MARK: DELETE
    
    /// Removes the task
    func deleteTask (id:ObjectId) {
        
        //UNwrap localRealm
        if let localRealm = localRealm {
            do {
                // Find specific task to delete
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else {return}
                
                try localRealm.write {
                    localRealm.delete(taskToDelete)
                    getTasks()
                }
            } catch {
                print("Error deleting the task \(id) from Realm: \(error) ")
            }
        }
    }
}
