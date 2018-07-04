//
//  RoundImageView.swift
//  RoundImageView
//
//  Created by Павел Анохов on 21.09.17.
//  Copyright © 2017 HomeHome. All rights reserved.
//

import UIKit

@IBDesignable
open class RoundImageView: UIImageView {
	
	// MARK: Border properties
	
	@IBInspectable
	open var borderWidth: CGFloat {
		set {
			if newValue < 0 {
				layer.borderWidth = 0
			} else {
				layer.borderWidth = newValue
			}
		}
		get {
			return layer.borderWidth
		}
	}
	
	@IBInspectable
	open var borderColor: UIColor? {
		set {
			layer.borderColor = newValue?.cgColor
		}
		get {
			if let borderColor = layer.borderColor {
				return UIColor(cgColor: borderColor)
			} else {
				return nil
			}
		}
	}
	
	
	// MARK: Rounding mode
	
	open var roundingMode: RoundingMode = .round {
		didSet {
			updateLayer()
			setNeedsDisplay()
		}
	}
	
	// MARK: Accessory views
	
	
	
	
	// MARK: Internal
	
	override open var frame: CGRect {
		didSet {
			updateLayer()
		}
	}
	
	override open var bounds: CGRect {
		didSet {
			updateLayer()
		}
	}
	
	private func updateLayer() {
		switch roundingMode {
		case .rectangle:
			layer.cornerRadius = 0
			
		case .round:
			if bounds.width < bounds.height {
				layer.cornerRadius = bounds.width / 2
			} else {
				layer.cornerRadius = bounds.height / 2
			}
			
		case .roundedCorners(let radius):
			layer.cornerRadius = radius
		}
	}
}
