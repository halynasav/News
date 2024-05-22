//
//  NewsNetworkManager.swift
//  News
//
//  Created by Galina Savenko on 22.04.2024.
//

import Foundation

protocol NewsNetworkManager {
    func fetchLatestNews(complition: @escaping(Result<[Article], Error>) -> Void) }

final class URLNewsNetworkManager: NewsNetworkManager {
    private var urlSession = URLSession.shared
    private var url: URL? = {
        URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&pageSize=10&page=1&apiKey=977e4b83946b42a1aba422dc52cefbb1")
    }()
    
    private var savedUrl: URL? = {
        URL(string: "https://newsapi.org/v2/everything?sources=bbc-news&pageSize=10&page=1&apiKey=977e4b83946b42a1aba422dc52cefbb1")
    }()
    
    func fetchLatestNews(complition: @escaping(Result<[Article], Error>) -> Void) {
        guard let url = url else {
            // TODO: add complition which return error
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        urlSession.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                complition(.failure(NetworkErrors.responseFaile))
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode <= 299 && response.statusCode >= 200 {
                
                let jsonDecoder = JSONDecoder()
                if let data = data, let articleResponse = try? jsonDecoder.decode(ArticleResponse.self, from: data) {
                    complition(.success(articleResponse.articles))
                    
                } else {
                    complition(.failure(NetworkErrors.parsingDataFail))
                }
            } else {
                complition(.failure(NetworkErrors.responseFaile))
            }
        }.resume()
    }
    
    func fetchSavedNews(page: Int, complition: @escaping(Result<[Article], Error>) -> Void) {
        var savedUrl: URL? = {
            URL(string: "https://newsapi.org/v2/everything?sources=bbc-news&pageSize=10&page=\(page)&apiKey=977e4b83946b42a1aba422dc52cefbb1")
        }()
        guard let url = savedUrl else {
            // TODO: add complition which return error
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        urlSession.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                complition(.failure(NetworkErrors.responseFaile))
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode <= 299 && response.statusCode >= 200 {
                
                let jsonDecoder = JSONDecoder()
                if let data = data, let articleResponse = try? jsonDecoder.decode(ArticleResponse.self, from: data) {
                    complition(.success(articleResponse.articles))
                    
                } else {
                    complition(.failure(NetworkErrors.parsingDataFail))
                }
            } else {
                complition(.failure(NetworkErrors.responseFaile))
            }
        }.resume()
    }

}

