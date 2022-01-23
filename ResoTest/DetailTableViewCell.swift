//
//  DetailTableViewCell.swift
//  ResoTest
//
//  Created by Артур Цыганов on 22.01.2022.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    let viewCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    let officeNameLabel: UILabel = {
        let officeName = UILabel()
        officeName.translatesAutoresizingMaskIntoConstraints = false
        officeName.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        officeName.numberOfLines = 0
        officeName.lineBreakMode = .byWordWrapping
        officeName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return officeName
    }()
    
    let officeAdressLabel: UILabel = {
        let officeAdress = UILabel()
        officeAdress.translatesAutoresizingMaskIntoConstraints = false
        officeAdress.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        officeAdress.textColor = #colorLiteral(red: 0.7694304585, green: 0.7645948529, blue: 0.7946180701, alpha: 1)
        officeAdress.numberOfLines = 0
        officeAdress.lineBreakMode = .byWordWrapping
        return officeAdress
    }()
    
    let officeStatusLabel: UILabel = {
        let officeStatus = UILabel()
        officeStatus.translatesAutoresizingMaskIntoConstraints = false
        officeStatus.text = "Окрыто"
        officeStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        officeStatus.textColor = #colorLiteral(red: 0, green: 0.4713379741, blue: 0.08517260104, alpha: 1)
        return officeStatus
    }()
    
    let officeRangeLabel: UILabel = {
        let officeRange = UILabel()
        officeRange.translatesAutoresizingMaskIntoConstraints = false
        officeRange.text = "до офиса: 1,4 км"
        officeRange.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        officeRange.textColor = #colorLiteral(red: 0.7694304585, green: 0.7645948529, blue: 0.7946180701, alpha: 1)
        return officeRange
    }()
    
    func setupViewCell() {
        addSubview(viewCell)
        viewCell.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewCell.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        viewCell.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        viewCell.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        viewCell.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setupOfficeNameLabel() {
        viewCell.addSubview(officeNameLabel)
        officeNameLabel.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 10).isActive = true
        officeNameLabel.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 10).isActive = true
        officeNameLabel.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -40).isActive = true
    }
    
    private func setupOfficeAdressLabel() {
        viewCell.addSubview(officeAdressLabel)
        officeAdressLabel.topAnchor.constraint(equalTo: officeNameLabel.bottomAnchor, constant: 10).isActive = true
        officeAdressLabel.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 10).isActive = true
        officeAdressLabel.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -40).isActive = true
    }
    
    private func setupOfficeStatusLabel() {
        viewCell.addSubview(officeStatusLabel)
        officeStatusLabel.topAnchor.constraint(equalTo: officeAdressLabel.bottomAnchor, constant: 10).isActive = true
        officeStatusLabel.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 10).isActive = true
        officeStatusLabel.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -10).isActive = true
    }
    
    private func setupOfficeRangeLabel() {
        viewCell.addSubview(officeRangeLabel)
        officeRangeLabel.topAnchor.constraint(equalTo: officeAdressLabel.bottomAnchor, constant: 10).isActive = true
        officeRangeLabel.leadingAnchor.constraint(equalTo: officeStatusLabel.trailingAnchor, constant: 5).isActive = true
        officeRangeLabel.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -10).isActive = true
        officeAdressLabel.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -40).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCell()
        setupOfficeNameLabel()
        setupOfficeAdressLabel()
        setupOfficeStatusLabel()
        setupOfficeRangeLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implement")
    }
}
