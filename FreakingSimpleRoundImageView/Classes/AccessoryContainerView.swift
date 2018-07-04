//
//  AccessoryContainerView.swift
//  FreakingSimpleRoundImageView
//
//  Created by Anokhov Pavel on 04.07.2018.
//

import UIKit

open class AccessoryContainerView: UIView {
	// MARK: Accessories
	private var accessories = [AccessoryPosition:UIView]()
	
	private var accBgIsSet = false
	
	open var accessoriesBackgroundColor: UIColor? = UIColor.red {
		didSet {
			accBgIsSet = true
			
			for view in accessories.values {
				view.backgroundColor = accessoriesBackgroundColor
			}
		}
	}
	
	open var accessoriesFontColor: UIColor = UIColor.white {
		didSet {
			for case let label as UILabel in accessories.values {
				label.textColor = accessoriesFontColor
			}
		}
	}
	
	open var accessoriesFont: UIFont = UIFont.systemFont(ofSize: 17) {
		didSet {
			for case let label as UILabel in accessories.values {
				label.font = accessoriesFont
			}
		}
	}
	
	open var accessoriesBorderWidth: CGFloat = 0.0 {
		didSet {
			for view in accessories.values {
				view.layer.borderWidth = accessoriesBorderWidth
			}
		}
	}
	
	open var accessoriesBorderColor: UIColor? {
		didSet {
			for view in accessories.values {
				view.layer.borderColor = accessoriesBorderColor?.cgColor
			}
		}
	}
	
	open var accessoriesContentInsets = UIEdgeInsets.zero {
		didSet {
			for case let label as RoundedLabel in accessories.values {
				label.textInsets = accessoriesContentInsets
			}
		}
	}
	
	open var accessoriesContainerInsets = UIEdgeInsets.zero {
		didSet {
			for (position, view) in accessories {
				removeConstraints(constraints.filter { ($0.firstItem as? UIView) == view })
				addConstraints(createConstraintsFor(item: view, relativeTo: self, atPosition: position, insets: accessoriesContentInsets))
			}
		}
	}
	
	open override var tintColor: UIColor! {
		didSet {
			if !accBgIsSet {
				accessoriesBackgroundColor = tintColor
			}
		}
	}
	
	public func setAccessory(_ accessory: AccessoryType?, at position: AccessoryPosition) {
		if let view = accessories[position] {
			view.removeFromSuperview()
		}
		
		guard let accessory = accessory else {
			return
		}
		
		let view: UIView
		
		switch accessory {
		case .label(let text):
			let label = RoundedLabel()
			label.clipsToBounds = true
			label.backgroundColor = accessoriesBackgroundColor
			label.font = accessoriesFont
			label.textColor = accessoriesFontColor
			label.text = text
			label.layer.borderColor = accessoriesBorderColor?.cgColor
			label.layer.borderWidth = accessoriesBorderWidth
			label.textInsets = accessoriesContentInsets
			
			view = label
		}
		
		accessories[position] = view
		addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		addConstraints(createConstraintsFor(item: view, relativeTo: self, atPosition: position, insets: accessoriesContainerInsets))
	}
	
	private func createConstraintsFor(item: UIView, relativeTo relative: UIView, atPosition position: AccessoryPosition, insets: UIEdgeInsets) -> [NSLayoutConstraint] {
		switch position {
		case .center:
			return [NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: relative, attribute: .centerX, multiplier: 1, constant: 0),
					NSLayoutConstraint(item: item, attribute: .centerY, relatedBy: .equal, toItem: relative, attribute: .centerY, multiplier: 1, constant: 0)]
			
		case .bottomLeft:
			return [NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: relative, attribute: .bottom, multiplier: 1, constant: -insets.bottom),
					NSLayoutConstraint(item: item, attribute: .leading, relatedBy: .equal, toItem: relative, attribute: .leading, multiplier: 1, constant: insets.left)]
			
		case .bottomRight:
			return [NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: relative, attribute: .bottom, multiplier: 1, constant: -insets.bottom),
					NSLayoutConstraint(item: item, attribute: .trailing, relatedBy: .equal, toItem: relative, attribute: .trailing, multiplier: 1, constant: -insets.right)]
			
		case .topLeft:
			return [NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: relative, attribute: .top, multiplier: 1, constant: insets.top),
					NSLayoutConstraint(item: item, attribute: .leading, relatedBy: .equal, toItem: relative, attribute: .leading, multiplier: 1, constant: insets.left)]
			
		case .topRight:
			return [NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: relative, attribute: .top, multiplier: 1, constant: insets.top),
					NSLayoutConstraint(item: item, attribute: .trailing, relatedBy: .equal, toItem: relative, attribute: .trailing, multiplier: 1, constant: -insets.right)]
		}
	}
}
