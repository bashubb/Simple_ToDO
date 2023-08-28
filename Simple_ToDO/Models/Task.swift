//
//  Task.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import Foundation
import RealmSwift

final class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
    @Persisted(originProperty: "tasks") var tasksGroup: LinkingObjects<TaskGroup>
    
}

final class TaskGroup : Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id : ObjectId
    @Persisted var tasks = RealmSwift.List<Task>()
    
}


