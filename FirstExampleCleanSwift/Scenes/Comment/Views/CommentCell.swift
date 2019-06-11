//
//  CommentCell.swift
//  FirstExampleCleanSwift
//
//  Created by ely.assumpcao.ndiaye on 06/06/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    static let cellIdentifier: String = "commentCell"
    
    let titleLabel: UILabel
    let emailLabel: UILabel
    let contentLabel: UILabel
    
    private struct ViewTraits {
        static let margin: CGFloat = 16.0
        static let titleFontSize: CGFloat = 14.0
        static let contentFontSize: CGFloat = 12.0
        let emailFontSize: CGFloat = 12.0
    }
    //é necessario inicializar os UiComponentes
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        titleLabel = UILabel()
        contentLabel = UILabel()
        emailLabel = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupComponents()
        setupFonts()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents() {
        contentView.addSubviewForAutolayout(titleLabel)
        contentView.addSubviewForAutolayout(contentLabel)
        contentView.addSubviewForAutolayout(emailLabel)
        
        titleLabel.numberOfLines = 0
        contentLabel.numberOfLines = 0
        emailLabel.numberOfLines = 0
        
        emailLabel.textColor = UIColor.gray
        
        titleLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        emailLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        contentLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 998), for: .vertical)
    }
    func setupFonts() {
        titleLabel.font = UIFont.systemFont(ofSize: ViewTraits.titleFontSize, weight: .bold)
        emailLabel.font = UIFont.systemFont(ofSize: ViewTraits.contentFontSize, weight: .light)
        contentLabel.font = UIFont.systemFont(ofSize: ViewTraits.contentFontSize, weight: .light)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: ViewTraits.margin),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                            constant: ViewTraits.margin),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -ViewTraits.margin)
            ])
        
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: ViewTraits.margin),
            emailLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor,
                                              constant: ViewTraits.margin),
            emailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                   constant: -ViewTraits.margin)
            ])
        
        NSLayoutConstraint.activate([
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: ViewTraits.margin),
            contentLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,
                                              constant: ViewTraits.margin),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                   constant: -ViewTraits.margin),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                 constant: -ViewTraits.margin)
            ])
    }

}
