//
//  LoginView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 11/7/22.
//

import SwiftUI
import Combine



struct LoginView: View {
    @StateObject var data = DataModel()
    @AppStorage("login") private var login: Bool = false
    @AppStorage("username") private var username: String = ""
    @EnvironmentObject  var userAuth: UserAuth
    @FocusState private var isFocused: Bool
    @State var isDisabled = false
    
    var body: some View {
        
        if login{
            
            StatsView( stats: data.stats)
                .task {
                    await data.loadStats(name: username)
                }
        } else{
            NavigationView{
                ZStack{
                    Color.cyan
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.7)
                        .foregroundColor(.white.opacity(0.15))
                    Circle()
                        .scale(1.35)
                        .foregroundColor(.white)
                    VStack{
                        Text("Login to Leetcode!")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        TextField("Username", text: $username)
                            .focused($isFocused)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        Button("Login"){
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                login = true
                            }
                            isFocused = false
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                }
            }

//                VStack {
//                    TextField("Username", text: $username)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .focused($isFocused)
//                    Button("Go") {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                            login = true
//                        }
//
//                        isFocused = false
//
//                    }
//
//                }
        }
        
    }
   
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(UserAuth())
    }
}