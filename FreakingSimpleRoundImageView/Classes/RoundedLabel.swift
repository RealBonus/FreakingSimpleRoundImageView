//
//  RoundedLabel.swift
//  FreakingSimpleRoundImageView
//
//  Created by Anokhov Pavel on 04.07.2018.
//

import UIKit

class RoundedLabel: UILabel {
	// MARK: Frame
	
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
	
	// MARK: Edge insets
	// Thanks to https://spin.atomicobject.com/2017/08/04/swift-extending-uilabel/
	
	var textInsets = UIEdgeInsets.zero {
		didSet {
			invalidateIntrinsicContentSize()
		}
	}
	
	override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
		let insetRect = UIEdgeInsetsInsetRect(bounds, textInsets)
		let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
		let invertedInsets = UIEdgeInsets(top: -textInsets.top,
										  left: -textInsets.left,
										  bottom: -textInsets.bottom,
										  right: -textInsets.right)
		return UIEdgeInsetsInsetRect(textRect, invertedInsets)
	}
	
	override func drawText(in rect: CGRect) {
		super.drawText(in: UIEdgeInsetsInsetRect(rect, textInsets))
	}
	
	
	// MARK: Internal
	
	private func updateLayer() {
		if bounds.width < bounds.height {
			layer.cornerRadius = bounds.width / 2
		} else {
			layer.cornerRadius = bounds.height / 2
		}
	}
}
