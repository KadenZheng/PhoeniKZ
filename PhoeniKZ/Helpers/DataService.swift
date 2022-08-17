//
//  DataService.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/10/22.
//

import Foundation

class DataService {
    
    static func getLocalFacultyData() -> [Faculty] {
        
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "faculty", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Faculty]()
        }
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                
                let facultyData = try decoder.decode([Faculty].self, from: data)
                
                // Add the unique IDs
                for r in facultyData {
                    r.id = UUID()
                }
                
                // Return the faculty
                return facultyData
                
            } catch {
                // error with parsing json
                print(error)
            }
            
        } catch {
            // error with getting data
            print(error)
        }
        
        return [Faculty]()
    }
    
    static func getLocalCategoriesData() -> [Category] {
        
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "categories", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Category]()
        }
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                
                let categoryData = try decoder.decode([Category].self, from: data)
                
                // Add the unique IDs
                for r in categoryData {
                    r.id = UUID()
                }
                
                // Return the categories
                return categoryData
                
            } catch {
                // error with parsing json
                print(error)
            }
            
        } catch {
            // error with getting data
            print(error)
        }
        
        return [Category]()
    }
    
}
