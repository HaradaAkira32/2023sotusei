//
//  JSONConverter.swift
//  SotuseiJson
//
//  Created by cmStudent on 2023/01/25.
//

import Foundation

class JSONConverter {
    
    let url:URL
    
    init(urlString: String){
        
        url = URL(string: urlString)!
    }
    
    init(url: URL) {
        self.url = url
    }
    
    func resume(handler: @escaping (Data?, URLResponse?, Error?) -> ()){
        let request = URLRequest(url: url)
        
        let task = URLSession.shared
            .dataTask(with: request, completionHandler: handler)
        
        task.resume()
    }
}
