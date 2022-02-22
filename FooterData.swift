//
//  FooterData.swift
//  BaseTableViewKit
//
//  Created by Гусейн on 22.02.2022.
//

import Foundation



public protocol FooterData {
    
    var height: CGFloat { get }
    
    func footer(for tableView: UITableView, section: Int) -> UIView?
    
    func hashValues() -> [Int]
}

extension FooterData {
    
    public func hashValues() -> [Int] {
        return [Int.random(in: 0...22000)]
    }
    
    public func footer(for tableView: UITableView, section: Int) -> UIView? {
        return nil
    }
}
