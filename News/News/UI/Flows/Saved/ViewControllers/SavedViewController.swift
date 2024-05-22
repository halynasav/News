//
//  SavedViewController.swift
//  News
//
//  Created by Galina Savenko on 10.04.2024.
//

import UIKit

class SavedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var savedTableView: UITableView!
    
    let networkManager = URLNewsNetworkManager()
    var articles = [SavedNews]()
    private let imageLoader = ImageLoader()
    private var page = 1
    private var isLoadingData = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedTableView.delegate = self
        savedTableView.dataSource = self
        fetchSavedNews()
    }
    
    private func fetchSavedNews() {
        isLoadingData = true
        networkManager.fetchSavedNews(page: page) { [self] res in
            isLoadingData = false
            switch res {
            case .success(let articles):
                print(articles)
                self.articles += articles.map{ SavedNews(article: $0) }
                DispatchQueue.main.async {
                    self.savedTableView.reloadData()
                }
                
                //                contentTypes.insert(.latestNews(articles), at: 1)
                //                DispatchQueue.main.async {
                //                    self.contentTableView.reloadData()
                //            }
            case .failure(let failure):
                //                TO DO: aff UI error state
                break
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SavedTableViewCell", for: indexPath) as? SavedTableViewCell {
            //            cell.config(title: item.title, tags: tags)
            let item = articles[indexPath.row]
            cell.configCell(item: item)
            
            if indexPath.row == articles.count-1 && !isLoadingData{
                page += 1
                fetchSavedNews()
            }
            
            if let imageNews = item.imageNews {
                cell.articleImage.image = imageNews
                cell.imageIndicator.isHidden = true
            } else {
                cell.imageIndicator.isHidden = false
                cell.imageIndicator.startAnimating()
                if let isLoading = item.isLoading, isLoading {
                    return cell
                }
                
                if let isLoading = item.isLoading, isLoading == false && item.imageNews == nil {
                    return cell
                }
                
                
                if let urlToImage = item.urlToImage, let url = URL(string: urlToImage) {
                    articles[indexPath.row].isLoading = true
                    imageLoader.fetchImage(from: url) { [weak self] image in
                        cell.articleImage.image = image
                        DispatchQueue.main.async{
                            self?.articles[indexPath.row].isLoading = false
                            cell.imageIndicator.stopAnimating()
                            cell.imageIndicator.isHidden = true
                            self?.articles[indexPath.row].imageNews = image
                        }
                    }
                }
                
                
                
                //                cell.articleImage.fetchImage(from: url)
            }
            return cell
        }
        return SavedTableViewCell()
    }
}
