//
//  HeaderData.swift
//  BaseTableViewKit
//
//  Created by Гусейн on 22.02.2022.
//

import UIKit

public protocol HeaderData {
    
    var height: CGFloat { get }
    
    func header(for tableView: UITableView, section: Int) -> UIView?
    
    func hashValues() -> [Int]
    
}

extension HeaderData {
    
    public func hashValues() -> [Int] {
        return [Int.random(in: 0...22000)]
    }
    
    public func header(for tableView: UITableView, section: Int) -> UIView? {
        return nil
    }
}
