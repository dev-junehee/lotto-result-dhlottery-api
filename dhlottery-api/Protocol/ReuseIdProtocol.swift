//
//  ReuseIdProtocol.swift
//  dhlottery-api
//
//  Created by junehee on 6/7/24.
//

import UIKit

protocol ReuseIdProtocol {
    static var id: String { get }
}

extension UIViewController: ReuseIdProtocol {
    static var id: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseIdProtocol {
    static var id: String {
        return String(describing: self)
    }
}
