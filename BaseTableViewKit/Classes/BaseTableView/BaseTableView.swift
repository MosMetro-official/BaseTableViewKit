//
//  BaseTableView.swift
//  BaseTableViewKit
//
//  Created by Слава Платонов on 08.02.2022.
//

import DifferenceKit

public typealias MenuData = (tableView: UITableView, indexPath: IndexPath, point: CGPoint, element: Any)
public typealias TableData = (tableView: UITableView, indexPath: IndexPath, element: Any)
public typealias HeaderData = (tableView: UITableView, section: Int)
public typealias CellDisplayData = (tableView: UITableView, cell: UITableViewCell, indexPath: IndexPath, element: Any)
public typealias CellWillDisplayData = (tableView: UITableView, cell: UITableViewCell, indexPath: IndexPath)

public class BaseTableView: UITableView {
    
    /// original data source
    private var viewState = [State]()
    public var rowAnimation: UITableView.RowAnimation = .fade
    public var shouldUseReload = false
    
    /// public data source. Affects original, used only for diff calculattions
    public var viewStateInput: [State] {
        get {
            return viewState
        }
        set {
            let changeset = StagedChangeset(source: viewState, target: newValue)
            reload(using: changeset, with: rowAnimation, interrupt: { [weak self] change in
                guard let self = self else { return true }
                return self.shouldUseReload }) { newState in
                self.viewState = newState
            }
        }
    }
    
     var onScroll: ((UIScrollView) -> ())?
     
    
    override public init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        delegate = self
        dataSource = self
        register(TitleHeaderView.nib, forHeaderFooterViewReuseIdentifier: TitleHeaderView.identifire)
        register(StandartImageCell.nib, forCellReuseIdentifier: StandartImageCell.identifire)
        register(BaseFooterView.nib, forHeaderFooterViewReuseIdentifier: BaseFooterView.identifire)
    }
}

extension BaseTableView: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewState.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewState[section].model.isCollapsed ? 0 : viewState[section].elements.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let element = self.viewState[safe: indexPath.section]?.elements[safe: indexPath.row]?.content else { return .init() }
        return element.cell(for: tableView, indexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let element = self.viewState[safe: indexPath.section]?.elements[safe: indexPath.row]?.content else { return }
        element.prepare(cell: cell, for: tableView, indexPath: indexPath)
    }
    
}

extension BaseTableView: UITableViewDelegate {
    
    
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let element = self.viewState[safe: indexPath.section]?.elements[safe: indexPath.row]?.content else { return 44 }
        return element.height
    }
    
    @available(iOS 13.0, *)
    public func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        guard let element = self.viewState[safe: indexPath.section]?.elements[safe: indexPath.row]?.content else { return nil }
        return element.menu(for: tableView, indexPath: indexPath, point: point)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
        
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let element = self.viewState[safe: indexPath.section]?.elements[safe: indexPath.row]?.content else { return }
        element.onSelect()
        deselectRow(at: indexPath, animated: true)
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        onScroll?(scrollView)
    }
}
