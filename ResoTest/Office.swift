//
//  Office.swift
//  ResoTest
//
//  Created by Артур Цыганов on 22.01.2022.
//


import Foundation


struct Office: Codable {
    let idokrug: Int
    let ndistanse, nlong: Double
    let saddress, sshortname, sshortaddress: String
    let lbankomat, lspr, lregCenter: Bool?
    let idunderground: [Idunderground]
    let lpaybycard: Bool?
    let sphone, sgraf: String
    let graf: [Graf]?
    let nlat: Double
    let cphone: [Cphone]
    let ntimezone: Ntimezone
    let id: Int
    let semail, sway, sgrafspr, swayauto: String?

    enum CodingKeys: String, CodingKey {
        case idokrug = "IDOKRUG"
        case ndistanse = "NDISTANSE"
        case nlong = "NLONG"
        case saddress = "SADDRESS"
        case sshortname = "SSHORTNAME"
        case sshortaddress = "SSHORTADDRESS"
        case lbankomat = "LBANKOMAT"
        case lspr = "LSPR"
        case lregCenter = "LREG_CENTER"
        case idunderground = "IDUNDERGROUND"
        case lpaybycard = "LPAYBYCARD"
        case sphone = "SPHONE"
        case sgraf = "SGRAF"
        case graf = "GRAF"
        case nlat = "NLAT"
        case cphone = "CPHONE"
        case ntimezone = "NTIMEZONE"
        case id = "ID"
        case semail = "SEMAIL"
        case sway = "SWAY"
        case sgrafspr = "SGRAFSPR"
        case swayauto = "SWAYAUTO"
    }
}

// MARK: - Cphone
struct Cphone: Codable {
    let sphone, sphonetype, sphoneadd: String

    enum CodingKeys: String, CodingKey {
        case sphone = "SPHONE"
        case sphonetype = "SPHONETYPE"
        case sphoneadd = "SPHONEADD"
    }
}

// MARK: - Graf
struct Graf: Codable {
    let sbegin: Sbegin
    let nday: Int
    let send: Send

    enum CodingKeys: String, CodingKey {
        case sbegin = "SBEGIN"
        case nday = "NDAY"
        case send = "SEND"
    }
}

enum Sbegin: String, Codable {
    case empty = ""
    case sbegin1000 = "10.00 "
    case sbegin930 = "9.30 "
    case the0800 = "08.00"
    case the0900 = "09.00"
    case the0930 = "09.30"
    case the1000 = "10.00"
    case the1030 = "10.30"
    case the1100 = "11.00"
    case the1200 = "12.00"
    case the830 = "8.30"
    case the900 = "9.00"
    case the930 = "9.30"
}

enum Send: String, Codable {
    case send1800 = " 18.00"
    case send2000 = " 20.00"
    case the10001800 = "10.0018.00"
    case the1400 = "14.00"
    case the1600 = "16.00"
    case the1630 = "16.30"
    case the1700 = "17.00"
    case the1800 = "18.00"
    case the1900 = "19.00"
    case the2000 = "20.00"
    case the2030 = "20.30"
    case the2100 = "21.00"
    case the2200 = "22.00"
    case the2400 = "24.00"
    case выходной = "выходной"
    case нет = "нет"
}

// MARK: - Idunderground
struct Idunderground: Codable {
    let sname: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case sname = "SNAME"
        case id = "ID"
    }
}

enum Ntimezone: String, Codable {
    case the0300 = " 03:00"
}

