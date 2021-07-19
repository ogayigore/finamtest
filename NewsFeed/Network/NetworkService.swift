//
//  NetworkService.swift
//  NewsFeed
//
//  Created by Igor Ogai on 15.07.2021.
//

import Foundation

protocol NetworkService {
    func getNews(news: @escaping ([News]) -> Void)
}

class NetworkServiceImpl: NetworkService {
    
    func getNews(news: @escaping ([News]) -> Void) {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?language=ru&category=business&apiKey=db45622fd890410dae700415169c7a03")!
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(NewsResponse.self, from: data)
                news(response.articles)
            } catch {
                print(error)
            }
        }
        session.resume()
    }
}
