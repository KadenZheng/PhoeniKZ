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
    @Published var phoenixPost = [PhoenixPost]()
    @Published var categories = [Category]()
    
    init() {
        
        self.faculty = DataService.getLocalFacultyData()
        self.categories = DataService.getLocalCategoriesData()
        
        getRemoteEventsData()
        
        getRemotePhoenixPost()
        
    }
    
    // MARK: - Remote Events
    
        func getRemoteEventsData() {
        
        // String path
        let urlString = "https://kadenzheng.github.io/PhoeniKZ/events.json"
        
        // Create a url object
        let url = URL(string: urlString)
        
        guard url != nil else {
            // Couldn't create url
            print("URL was nil")
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
                print(error!.localizedDescription)
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
                print(error.localizedDescription)
            }
        }
        
        // Kick off data task
        dataTask.resume()
        
    }
    
    
    // MARK: - Remote Phoenix Post
    
    func getRemotePhoenixPost() {
        
        // String path
        let urlString = "https://kadenzheng.github.io/PhoeniKZ/phoenixpost.json"
        
        // Create a url object
        let url = URL(string: urlString)
        
        guard url != nil else {
            // Couldn't create url
            print("URL was nil")
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
                print(error!.localizedDescription)
                return
            }
            
            do {
                // Create json decoder
                let decoder = JSONDecoder()
                
                // Decode
                let decodedPP = try decoder.decode([PhoenixPost].self, from: data!)
                
                for r in decodedPP {
                    r.id = UUID()
                }
                
                DispatchQueue.main.async {
                    // Append parsed papers into phoenixpost property
                    self.phoenixPost += decodedPP
                }
            }
            catch {
                // Couldn't parse json
                print(error.localizedDescription)
            }
        }
        
        // Kick off data task
        dataTask.resume()
    }
}
