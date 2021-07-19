//
//  ViewController.swift
//  NewsFeed
//
//  Created by Igor Ogai on 15.07.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    //MARK:- Private Properties
    
    private(set) lazy var customView = view as! FeedView
    
    private let networkService = NetworkServiceImpl()
    
    private var news = [News]()

    //MARK:- Lifecycle
    
    override func loadView() {
        view = FeedView()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Новости"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        reloadData()
    }

    //MARK:- Private Methods
    
    private func configure() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }
    
    private func reloadData() {
        networkService.getNews { result in
            self.news = result
            DispatchQueue.main.async {
                self.customView.tableView.reloadData()
            }
        }
    }
    
}

//MARK:- UITableViewDelegate & UITableViewDataSource

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = news[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.cell, for: indexPath) as? NewsCell else { return UITableViewCell() }
        
        cell.configureCell(newsModel: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let newsDetailsVC = NewsDetailsViewController()
        let news = news[indexPath.row]
        
        newsDetailsVC.news = news
        
        navigationController?.pushViewController(newsDetailsVC, animated: true)
    }
    
    //MARK:- Deselect row
    override func viewWillAppear(_ animated: Bool) {
        
        if let index = self.customView.tableView.indexPathForSelectedRow {
            self.customView.tableView.deselectRow(at: index, animated: true)
        }
    }
    
}
