//
//  phonebookApp.swift
//  phonebook
//
//  Created by Jitendra Nirnejak on 09/06/23.
//

import SwiftUI

@main
struct phonebookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
