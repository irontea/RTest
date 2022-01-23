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


    let titleView = UIView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "Офисы РЕСО-Гарантия"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func setupNavigationBar() {
        setupTitleView()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.1454818547, green: 0.4972493052, blue: 0.2528410554, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), .font: UIFont.systemFont(ofSize: 18, weight: .semibold)]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.topItem?.title = ""
        
        navigationItem.titleView = titleView
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        menuBtn.setImage(UIImage(named:"filter"), for: .normal)
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 22)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 22)
        currHeight?.isActive = true
        navigationItem.rightBarButtonItem = menuBarItem
    }
    

    func setupTitleView() {
        titleView.addSubview(titleLabel)
        titleView.addSubview(segmentedControl)
//
//        titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor).isActive = true
//        titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true

//        segmentedControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
//        segmentedControl.bottomAnchor.constraint(equalTo: titleView.bottomAnchor ).isActive = true
//        segmentedControl.leadingAnchor.constraint(equalTo: titleView.leadingAnchor).isActive = true
//        segmentedControl.trailingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
//        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
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
        cell.layoutMargins = UIEdgeInsets.zero
        
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


