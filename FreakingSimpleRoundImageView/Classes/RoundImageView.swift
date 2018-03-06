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
	
	override open var frame: CGRect {
		didSet {
			if frame.width < frame.height {
				layer.cornerRadius = frame.width / 2
			} else {
				layer.cornerRadius = frame.height / 2
			}
		}
	}
	
	override open var bounds: CGRect {
		didSet {
			if bounds.width < bounds.height {
				layer.cornerRadius = bounds.width / 2
			} else {
				layer.cornerRadius = bounds.height / 2
			}
		}
	}
}
