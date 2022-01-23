//
//  NavigationBarTitleView.swift
//  ResoTest
//
//  Created by Артур Цыганов on 23.01.2022.
//

import UIKit

class NavigationBarTitleView: UIView {

    let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    override func viewDidload() {
        super.viewDidload()
    }
    view?.addSubview(mainView)
}
