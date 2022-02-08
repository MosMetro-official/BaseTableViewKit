//
//  MainView.swift
//  BaseTableViewKit_Example
//
//  Created by Слава Платонов on 08.02.2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import BaseTableViewKit

class MainView: UIView {
    
    struct ViewState {
        
        struct Row: _StandartImage {
            var title      : String
            var leftImage  : UIImage?
            var separator  : Bool
            let onSelect   : () -> ()
            var backgroundColor: UIColor?
        }
        
        struct Header: _TitleHeaderView {
            var title: String
            var style: HeaderTitleStyle
            var backgroundColor: UIColor
            var isInsetGrouped: Bool
        }
        
        struct Footer: _BaseFooterView {
            var text: String
            var attributedText: NSAttributedString?
            var isInsetGrouped: Bool
        }
    }
    
    var table: BaseTableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTableView()
    }
    
    private func setupTableView() {
        table = BaseTableView(frame: .zero, style: .grouped)
        table.sectionHeaderHeight = 44
        table.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(table)

        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: topAnchor),
            table.leadingAnchor.constraint(equalTo: leadingAnchor),
            table.trailingAnchor.constraint(equalTo: trailingAnchor),
            table.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
