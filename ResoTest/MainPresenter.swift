//
//  MainPresenter.swift
//  ResoTest
//
//  Created by Артур Цыганов on 22.01.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func netwokrOn()
    func networkOff()
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func setComment()
}


class MainPresenter: MainViewPresenterProtocol {

    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService

    }
    
    func setComment() {
        
    }
    
    
}

