//
//  TabView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/31/22.
//

import SwiftUI
import CoreData
struct TabViewScreen: View {
    @State var notification: Bool = false
    
    
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                    
                }
            LoginView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("My Stats")
                }
            DSAlgoView()
                .tabItem{
                    Image(systemName: "book")
                    Text("Learn")
                        
                }
        }
        .onAppear(){
            if notification == false{
                NotificationManager.instance.scheduelNotification()
                NotificationManager.instance.requestAuthorization()
                print("Scheduled")
                print(notification)
            }
            self.notification = true
            UIApplication.shared.applicationIconBadgeNumber = 0
            
           
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewScreen()
    }
}
