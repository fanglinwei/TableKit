import UIKit

open class NavigationRow<T: UITableViewCell>: BasicRow<T>, NavigationRowCompatible, Equatable {
        
    public var accessoryButtonAction: RowAction?
    
    public override var accessoryType: UITableViewCell.AccessoryType {
        get {
            if let accessory = _accessoryType { return accessory }
            switch (action, accessoryButtonAction) {
            case (nil, nil):      return .none
            case (.some, nil):    return .disclosureIndicator
            case (nil, .some):    return .detailButton
            case (.some, .some):  return .detailDisclosureButton
            }
        }
        set {}
    }
    
    private var _accessoryType: UITableViewCell.AccessoryType?
    
    public override var isSelectable: Bool {
        get { action != nil }
        set {}
    }
    
    public static func == (lhs: NavigationRow, rhs: NavigationRow) -> Bool {
        return lhs.text == rhs.text &&
               lhs.detailText == rhs.detailText &&
               lhs.icon == rhs.icon
    }
}

extension NavigationRow {
    
    public func accessoryButtonAction(_ value: RowAction?) -> Self {
        self.accessoryButtonAction = value
        return self
    }
    
    public func accessoryType(_ value: UITableViewCell.AccessoryType) -> Self {
        _accessoryType = value
        return self
    }
}