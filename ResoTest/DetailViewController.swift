//
//  DetailViewController.swift
//  ResoTest
//
//  Created by Артур Цыганов on 22.01.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var presenter: DetailViewPresenterProtocol!
 
    let appearance = UINavigationBarAppearance()

    var safeArea:UILayoutGuide!
 
    let segmentedControl: UISegmentedControl = {
        lazy var segmentedControl = UISegmentedControl(items: ["Cписком", "На карте"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.layer.cornerRadius = 5.0
        segmentedControl.backgroundColor = #colorLiteral(red: 0.1454818547, green: 0.4972493052, blue: 0.2528410554, alpha: 1)
        segmentedControl.tintColor = UIColor.white
        return segmentedControl
    }()
    
         

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 5).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func setupNavigationBar() {
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.1454818547, green: 0.4972493052, blue: 0.2528410554, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), .font: UIFont.systemFont(ofSize: 18, weight: .semibold)]
        appearance.shadowColor = .clear
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.topItem?.title = ""
        navigationItem.title = "Офисы РЕСО-Гарантия"
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        menuBtn.setImage(UIImage(named:"filter"), for: .normal)
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 22)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 22)
        currHeight?.isActive = true
        self.navigationItem.rightBarButtonItem = menuBarItem
    }
    
    func setupSegmentedControl() {
        self.view.addSubview(segmentedControl)
        safeArea = view.layoutMarginsGuide
        segmentedControl.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 5).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 25).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1454818547, green: 0.4972493052, blue: 0.2528410554, alpha: 1)
        setupNavigationBar()
        setupSegmentedControl()
        setupTableView()

       

    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.offices?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailTableViewCell
        let office = presenter.offices?[indexPath.row]
        cell.officeNameLabel.text = office?.sshortname
        cell.officeAdressLabel.text = office?.sshortaddress
        cell.accessoryType = .disclosureIndicator

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}

extension DetailViewController: DetailViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}



