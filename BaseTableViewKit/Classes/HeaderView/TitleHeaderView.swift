//
//  TitleHeaderView.swift
//  BaseTableViewKit
//
//  Created by Слава Платонов on 08.02.2022.
//

import UIKit

public protocol _TitleHeaderView {

    var title: String { get set }
    var style: HeaderTitleStyle { get set }
    var backgroundColor: UIColor { get set }
    var isInsetGrouped: Bool { get set }
}

class TitleHeaderView: UITableViewHeaderFooterView {
    @IBOutlet private weak var leftLabelConstaint: NSLayoutConstraint!
    
    @IBOutlet private weak var backView: UIView!

    @IBOutlet private weak var mainTitleLabel: UILabel!

    func configure(_ data: _TitleHeaderView) {
        self.mainTitleLabel.font = data.style.font()
        self.mainTitleLabel.text = data.title
        self.backView.backgroundColor = data.backgroundColor
        self.leftLabelConstaint.constant = data.isInsetGrouped ? 20 : 16
        self.layoutIfNeeded()
    }
}
