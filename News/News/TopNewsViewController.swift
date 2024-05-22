//
//  ViewController.swift
//  News
//
//  Created by Test on 03.04.2024.
//

import UIKit

class TopNewsViewController: UIViewController {
    private var articleResponse: ArticleResponse?

    override func viewDidLoad() {
        super.viewDidLoad()
        let urlSeasson = URLSession.shared
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&pageSize=10&page=1&apiKey=977e4b83946b42a1aba422dc52cefbb1") else {
            print("url adress is not valided")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        urlSeasson.dataTask(with: urlRequest) { data, response, error in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                let articleResponse = try? jsonDecoder.decode(ArticleResponse.self, from: data)
                self.articleResponse = articleResponse
                print("🍏")
                
                if let articleResponse = articleResponse {
                    print(articleResponse)
                }
                
            }
        }.resume()
    }

}

