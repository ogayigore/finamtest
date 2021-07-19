//
//  NewsCell2.swift
//  NewsFeed
//
//  Created by Igor Ogai on 17.07.2021.
//

import UIKit

class NewsCell2: UITableViewCell {
    
    //MARK:- Public Properties
    
    static var cell = "cell2"
    
    //MARK:- Private Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK:- Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: NewsCell.cell)
        backgroundColor = .cyan
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Private Methods
    
    private func setup() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            contentLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            contentLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    //MARK:- Public Methods
    
    func configureCell(newsModel: News) {
        print(newsModel)
        
        titleLabel.text = newsModel.title
        contentLabel.text = newsModel.description
    }
}
