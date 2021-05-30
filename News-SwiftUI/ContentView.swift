//
//  ContentView.swift
//  News-SwiftUI
//
//  Created by Abinash Pradhan on 30/05/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkmaneger = NetworkManeger()
    
    var body: some View {
        NavigationView {
            List(networkmaneger.posts){post in
                Text(post.title)
            }
            .navigationTitle("News")
        }
        
        .onAppear{
             self.networkmaneger.fetchdata()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

