//
//  BaseFooterView.swift
//  BaseTableViewKit
//
//  Created by Слава Платонов on 08.02.2022.
//

import UIKit

public protocol _BaseFooterView {
    var text: String { get set }
    var attributedText: NSAttributedString? { get set }
    var isInsetGrouped: Bool { get }
}

class BaseFooterView: UITableViewHeaderFooterView {

    @IBOutlet weak var leftLabelAnchor: NSLayoutConstraint!
    @IBOutlet weak var mainTitle: UILabel!
    
    func configure(_ data: _BaseFooterView) {
        if let attributedText = data.attributedText {
            mainTitle.attributedText = attributedText
        } else {
            mainTitle.text = data.text
        }
        self.leftLabelAnchor.constant = data.isInsetGrouped ? 32 : 16
        self.layoutIfNeeded()
    }
}

