//
//  UIView.swift
//  FirstExampleCleanSwift
//
//  Created by ely.assumpcao.ndiaye on 02/06/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviewForAutolayout(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
    }
}
