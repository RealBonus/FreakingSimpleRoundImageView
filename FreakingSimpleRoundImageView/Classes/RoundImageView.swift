//
//  RoundImageView.swift
//  RoundImageView
//
//  Created by Павел Анохов on 21.09.17.
//  Copyright © 2017 HomeHome. All rights reserved.
//

import UIKit

@IBDesignable
class RoundImageView: UIImageView {
	@IBInspectable
	var borderWidth: CGFloat {
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
	var borderColor: UIColor? {
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
	
	override var frame: CGRect {
		didSet {
			if frame.width < frame.height {
				layer.cornerRadius = frame.width / 2
			} else {
				layer.cornerRadius = frame.height / 2
			}
		}
	}
}
