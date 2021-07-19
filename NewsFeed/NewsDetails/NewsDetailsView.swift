//
//  NewsDetailsView.swift
//  NewsFeed
//
//  Created by Igor Ogai on 16.07.2021.
//

import UIKit

class NewsDetailsView: UIView {
    
    //MARK:- Private Properties
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var contentImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private(set) lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .gray
        label.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK:- Initializers
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Private Methods
    
    private func setup() {
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(contentImage)
        addSubview(contentLabel)
        addSubview(authorLabel)
        addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            
            contentImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            contentImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentImage.widthAnchor.constraint(equalTo: widthAnchor),
            contentImage.heightAnchor.constraint(lessThanOrEqualToConstant: 300),
            
            contentLabel.topAnchor.constraint(equalTo: contentImage.bottomAnchor, constant: 8),
            contentLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            contentLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            
            authorLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 8),
            authorLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            authorLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            
            timeLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            timeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            timeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8)
        ])
    }
}
