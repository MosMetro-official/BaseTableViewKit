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
    
    private var tableView: BaseTableView!
    
    struct ViewState {
        
        var state: [State]
        
        struct Row: _StandartImage {
            let title: String
            let leftImage: UIImage?
            let separator: Bool
            let onSelect: () -> ()
            let backgroundColor: UIColor?
        }
        
        struct Header: _TitleHeaderView {
            let title: String
            let style: HeaderTitleStyle
            let backgroundColor: UIColor
            let isInsetGrouped: Bool
        }
        
        struct Footer: _BaseFooterView {
            let text: String
            let attributedText: NSAttributedString?
            let isInsetGrouped: Bool
        }
    }
    
    public var viewState: ViewState = ViewState(state: []) {
        didSet {
            DispatchQueue.main.async {
                self.tableView.viewStateInput = self.viewState.state
            }
        }
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTableView()
    }
    
    private func setupTableView() {
        tableView = BaseTableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
