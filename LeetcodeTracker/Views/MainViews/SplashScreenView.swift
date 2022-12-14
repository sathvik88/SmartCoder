//
//  SplashScreenView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 12/23/22.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive{
            TabViewScreen()
        } else{
            VStack{
                VStack{
                    Image(systemName: "chevron.left.forwardslash.chevron.right")
                        .font(.system(size:80))
                    Text("Leet Track")
                        .font(.system(size: 30))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
            }
            
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
            
    }
}
