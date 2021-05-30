//
//  NetworkManeger.swift
//  News-SwiftUI
//
//  Created by Abinash Pradhan on 30/05/21.
//

import Foundation

class NetworkManeger:ObservableObject {
    @Published var posts = [Post]()
    
    func fetchdata(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
        let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response , error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safedata = data{
                        do{
                            let results = try decoder.decode(Results.self, from: safedata)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            self.posts = results.hits
                        }catch{
                            print(error)
                        }
                    }
                    
                }
            }
            task.resume()
    }
        
}
}
