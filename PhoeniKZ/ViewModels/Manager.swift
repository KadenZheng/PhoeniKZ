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
    @Published var clubs = [Club]()
    @Published var bulletinData = [Bulletin]()
    @Published var activitiesGalleryData = [ActivitiesGallery]()
    @Published var randomImages: [String] = ["bench", "frisbees", "pinecones", "mosaic_phoenix-black", "night_school", "red_flowers"]
    
    init() {
        
        self.faculty = DataService.getLocalFacultyData()
        self.categories = DataService.getLocalCategoriesData()
        
        getRemoteEventsData()
        
        getRemotePhoenixPost()
        
        getRemoteClubData()
        
        getRemoteBulletinData()
        
        getRemoteActivitiesGallery()
        
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
                print(error)
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
                print(error)
            }
        }
        
        // Kick off data task
        dataTask.resume()
    }
    
    // MARK: - Remote Club Data
    
    func getRemoteClubData() {
        
        // String path
        let urlString = "https://kadenzheng.github.io/PhoeniKZ/clubs.json"
        
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
                let decodedClubs = try decoder.decode([Club].self, from: data!)
                
                for r in decodedClubs {
                    r.id = UUID()
                }
                
                DispatchQueue.main.async {
                    // Append parsed papers into phoenixpost property
                    self.clubs += decodedClubs
                }
            }
            catch {
                // Couldn't parse json
                print(error)
            }
        }
        
        // Kick off data task
        dataTask.resume()
    }
    
    // MARK: - Remote Bulletin
    
    func getRemoteBulletinData() {
        
        // String path
        let urlString = "https://kadenzheng.github.io/PhoeniKZ/bulletin.json"
        
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
                let bulletinDataDecoded = try decoder.decode([Bulletin].self, from: data!)
                
                for r in bulletinDataDecoded {
                    r.id = UUID()
                }
                
                DispatchQueue.main.async {
                    // Append parsed events into events property
                    self.bulletinData += bulletinDataDecoded
                }
            }
            catch {
                // Couldn't parse json
                print(error)
            }
        }
        
        // Kick off data task
        dataTask.resume()
        
    }
    
    // MARK: - Activities Gallery
    
    func getRemoteActivitiesGallery() {
        
        // String path
        let urlString = "https://kadenzheng.github.io/PhoeniKZ/ActivitiesGallery.json"
        
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
                let activitiesGalleryDecoded = try decoder.decode([ActivitiesGallery].self, from: data!)
                
                for r in activitiesGalleryDecoded {
                    r.id = UUID()
                }
                
                DispatchQueue.main.async {
                    // Append parsed events into events property
                    self.activitiesGalleryData += activitiesGalleryDecoded
                }
            }
            catch {
                // Couldn't parse json
                print(error)
            }
        }
        
        // Kick off data task
        dataTask.resume()
    }
}

