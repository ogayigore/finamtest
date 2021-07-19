//
//  NewsDetailsViewController.swift
//  NewsFeed
//
//  Created by Igor Ogai on 16.07.2021.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    //MARK:- Private Properties
    
    private(set) lazy var customView = view as! NewsDetailsView
    
    //MARK:- Public Properties
    
    var news: News?
    
    //MARK:- Lifecycle
    
    override func loadView() {
        view = NewsDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }

    //MARK:- Private Methods
    
    private func setup() {
        customView.titleLabel.text = news?.title
        customView.contentImage.kf.setImage(with: news?.image)
        customView.contentLabel.text = news?.description
        customView.authorLabel.text = news?.author
        customView.timeLabel.text = news?.time
    }
    
}
