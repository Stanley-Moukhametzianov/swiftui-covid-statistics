//
//  NewsDownloadManager.swift
//  Covid Data
//
//  Created by Stanley Moukh on 7/24/21.

import Foundation
final class NewsDownloadManager: ObservableObject{
    @Published var newsArticles = [News]()
    private let newsUrlString = "https://newsapi.org/v2/everything?qInTitle=covid&language=en&sortBy=publishedAt&apiKey=\(NewsAPI.key)"

    init(){
        download()
    }
    func download(){
        NetworkManager<NewsResponse>().fetch(from: URL(string: newsUrlString)!){ result in
            switch result{
            case .failure(let err):
                print(err)
            
            case .success(let resp):
                DispatchQueue.main.async {
                    self.newsArticles = resp.articles
                }
            }
        
        }
    }
}
