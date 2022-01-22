//
//  ViewController.swift
//  ResoTest
//
//  Created by Артур Цыганов on 22.01.2022.
//

import UIKit
//600 210 45
class MainViewController: UIViewController {


    let getOfficeButton: UIButton = {
        let getOfficeButton = UIButton()
        getOfficeButton.layer.cornerRadius = 10
        getOfficeButton.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7960784314, alpha: 1)
        let customButtonTitle = NSMutableAttributedString(string: "Получить список \n офисов", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium),
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ])
        getOfficeButton.titleLabel?.textAlignment = .center
        getOfficeButton.titleLabel?.numberOfLines = 0
        getOfficeButton.titleLabel?.sizeToFit()
        getOfficeButton.setAttributedTitle(customButtonTitle, for: .normal)
        getOfficeButton.translatesAutoresizingMaskIntoConstraints = false
        getOfficeButton.addTarget(self, action: #selector(getOfficeFromNetwork), for: .touchUpInside)
        return getOfficeButton
    }()
    
    @objc func getOfficeFromNetwork() {
        
    }
    
    func setupGetOfficeButton() {
        view.addSubview(getOfficeButton)
        getOfficeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getOfficeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        getOfficeButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        getOfficeButton.widthAnchor.constraint(equalToConstant: 210).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGetOfficeButton()
        
    }


}

