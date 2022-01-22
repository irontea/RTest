//
//  ModuleBuilder.swift
//  ResoTest
//
//  Created by Артур Цыганов on 22.01.2022.
//

import UIKit


protocol Builder {
    static func createMainModule() -> UIViewController
    static func crateDetailModule() -> UIViewController
}

class ModelBuilder: Builder {

    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func crateDetailModule() -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
