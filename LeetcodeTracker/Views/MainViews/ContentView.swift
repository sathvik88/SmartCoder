//
//  ContentView.swift
//  LeetcodeTracker
//
//  Created by Sathvik Konuganti on 7/27/22.
//

import SwiftUI
import CoreData


struct ContentView: View {
    
    @ObservedObject var data = DataModel()
    @State private var searchText = ""
    @Environment(\.openURL) var openURL
    

    
    var body: some View {
        NavigationView {
            List{
                ForEach(data.jsonData.filter({ "\($0)".contains(searchText) || searchText.isEmpty})) { list in
                    HStack{
                        Button {
                            openURL(URL(string: list.solution)!)
                            
                        } label: {
                            Text(list.question)
                                .fontWeight(.medium)
                        }
                        
                        Spacer()
                        
                        if(list.difficulty == "Easy"){
                            Text(list.difficulty)
                                .foregroundColor(.green)
                                .fontWeight(.medium)
                            
                        }
                        else if(list.difficulty == "Medium"){
                            Text(list.difficulty)
                                .foregroundColor(.orange)
                                .fontWeight(.medium)
                        }
                        else{
                            Text(list.difficulty)
                                .foregroundColor(.red)
                                .fontWeight(.medium)
                        }
                        Spacer()
                        Image(systemName: data.contains(list) ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                            .onTapGesture{
                                data.toggleFavs(question: list)
                            }
                    }
                }
            }
            .navigationBarTitle("Questions")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {}, label: {
                        NavigationLink(destination: FavoritesView()) {
                            Image(systemName: "star")
                        }
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {}, label: {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                        }
                    })
                }

                
            }
            .refreshable {
                data.load()
            }
            
        }
        .searchable(text: $searchText)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}


