//
//  Manager.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/10/22.
//

import Foundation

class Manager : ObservableObject {
    
    @Published var faculty = [Faculty]()
    @Published var events = [Event]()
    
    init() {
        self.faculty = DataService.getLocalData()
        
        getRemoteData()
    }
    
    func getRemoteData() {
            
            // String path
            let urlString = "https://kadenzheng.github.io/PhoeniKZ/events.json"
            
            // Create a url object
            let url = URL(string: urlString)
            
            guard url != nil else {
                // Couldn't create url
                return
            }
            
            // Create a URLRequest object
            let request = URLRequest(url: url!)
            
            // Get the session and kick off the task
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                
                // Check if there's an error
                guard error == nil else {
                    // There was an error
                    return
                }
                
                do {
                    // Create json decoder
                    let decoder = JSONDecoder()
                
                    // Decode
                    let events = try decoder.decode([Event].self, from: data!)
                    
                    for r in events {
                        r.id = UUID()
                    }
                    
                    DispatchQueue.main.async {
                    // Append parsed events into events property
                    self.events += events
                    }
                }
                catch {
                    // Couldn't parse json
                }
            }
            
            // Kick off data task
            dataTask.resume()
            
        }
    
}
