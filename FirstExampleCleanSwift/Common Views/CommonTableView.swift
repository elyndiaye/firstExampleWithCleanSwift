//
//  PostView.swift
//  FirstExampleCleanSwift
//
//  Created by ely.assumpcao.ndiaye on 02/06/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

class CommonTableView: UIView{
    let tableView: UITableView
    
    override init(frame: CGRect) {
        //Inicializando a tableView
        tableView = UITableView()
        
        super.init(frame: frame)
        
        setupComponents() //Agregar la vista al parent view
        setupConstraints() // Setear constraints
    }
    //Pode ignorar quando n tem storyboard( e quando tem tbm hahahaha)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents() {
        addSubviewForAutolayout(tableView)
    }
    func setupConstraints() {
        //NSLayoutConst... é um construtor de constraints Anchor == limites, leading - limite esquerdo, trailing - direito
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
    }

}
