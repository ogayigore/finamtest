//
//  NewsCell.swift
//  NewsFeed
//
//  Created by Igor Ogai on 15.07.2021.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {
    
    //MARK:- Public Properties
    
    static var cell = "cell"
    
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
    
    private lazy var contentImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Light", size: 16)
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
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Private Methods
    
    private func setup() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(contentImage)
        contentView.addSubview(authorLabel)
        contentView.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            contentLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            contentLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            contentImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            contentImage.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 8),
            contentImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                                        contentImage.heightAnchor.constraint(equalToConstant: 200),
            contentImage.widthAnchor.constraint(equalTo: widthAnchor),
            authorLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            authorLabel.topAnchor.constraint(equalTo: contentImage.bottomAnchor, constant: 8),
            authorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            authorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    //MARK:- Public Methods
    
    func configureCell(newsModel: News) {
        if let author = newsModel.author {
            authorLabel.text = author
        }
        
        if let image = newsModel.image {
            contentImage.kf.setImage(with: image)
        } 
        
        titleLabel.text = newsModel.title
        contentLabel.text = newsModel.description
    }
}
