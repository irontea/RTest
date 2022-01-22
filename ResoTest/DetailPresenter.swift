//
//  DetailPresenter.swift
//  ResoTest
//
//  Created by Артур Цыганов on 22.01.2022.
//

import Foundation


protocol DetailViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}


protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol)
    func getOffices()
    var offices: [Office]? {get set}
}


class DetailPresenter: DetailViewPresenterProtocol {

    var offices: [Office]?
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getOffices()
    }
    
    func getOffices() {
        networkService.getOffices {[weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let offices):
                    self.offices = offices
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
