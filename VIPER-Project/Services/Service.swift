//
//  Service.swift
//  MVC-Project
//
//  Created by Gerson Janhuel on 28/08/20.
//

import Foundation

class Service: NSObject {
    // our singleton
    static let shared = Service()
    
    func fetchCourses(completion: @escaping([Course]?, Error?) -> ()) {
        
        
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                completion(nil, err)
                print("Failed to fetch! \(err)")
                return
            }
            
            // fetch the response
            guard let data = data else { return }
            
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                
                // complete the request in main thread
                DispatchQueue.main.async {
                    completion(courses, nil)
                }
                
            } catch let jsonError {
                print("Failed to decode! \(jsonError)")
            }
        }.resume()
    }
}
