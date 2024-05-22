//
//  Fetch Image.swift
//  News
//
//  Created by Galina Savenko on 20.05.2024.
//

import Foundation
import UIKit

class ImageLoader {
    
    func fetchImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching image: \(error)")
                completion(nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                print("Invalid response or data")
                completion(nil)
                return
            }
            let image = UIImage(data: data)

            DispatchQueue.main.async {
                completion(image)
            }
        }
        
        task.resume()
    }
}

extension UIImageView {
    
    func fetchImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors
            if let error = error {
                print("Error fetching image: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                print("Invalid response or data")
                return
            }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
