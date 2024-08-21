//
//  kronosApp.swift
//  kronos
//
//  Created by shimizu on 2024/08/20.
//

import SwiftUI
import SwiftData

//TODO: Podfileの[pod 'Google-Mobile-Ads-SDK']のコメントをはずして[pod update]した後、Admob.swiftのコメントとinfo.plistの変更を行ってから
// import GoogleMobileAds

// class AppDelegate: UIResponder, UIApplicationDelegate {

//     var window: UIWindow?

//     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//         GADMobileAds.sharedInstance().start(completionHandler: nil)
//         return true
//     }
// }

@main
struct kronosApp: App {
  // @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
