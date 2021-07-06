//
//  ContentModel.swift
//  LearningApp
//
//  Created by Casey Lujan on 7/5/21.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init() {
        getLocalData()
    }
    
    func getLocalData(){
        
        //Get a URL to the JSON File
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            //Read the file into a Data object
            let jsonData = try Data(contentsOf: jsonURL!)
            
            //Try to decode the Json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            //Assign parsed modules to the modules property
            
            self.modules = modules
            
        }
        catch {
            // some Error
            print("Couldn't Parse the Data")
        }
        
        //Get a URL to the Style File
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            let styleData = try Data(contentsOf: styleURL!)
            
            self.styleData = styleData
        }
        catch {
            // Print Error
            print("Coultn' Parse the Style Data")
        }
    }
}
