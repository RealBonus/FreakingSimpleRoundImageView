//
//  RoundedLabel.swift
//  FreakingSimpleRoundImageView
//
//  Created by Anokhov Pavel on 04.07.2018.
//

import UIKit

open class RoundedLabel: UILabel {
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
	
	open var textInsets = UIEdgeInsets.zero {
		didSet {
			invalidateIntrinsicContentSize()
		}
	}
	
	private var drawRect: CGRect?
	
	override open func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
		let insetRect = bounds.inset(by: textInsets)
		let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
		let invertedInsets = UIEdgeInsets(top: -textInsets.top,
										  left: -textInsets.left,
										  bottom: -textInsets.bottom,
										  right: -textInsets.right)
		
		let newRect = textRect.inset(by: invertedInsets)
		
		if newRect.height > newRect.width {
			let delta = (newRect.height - newRect.width) / 2
			drawRect = CGRect(x: newRect.origin.x + delta, y: newRect.origin.y, width: newRect.width, height: newRect.height)
			return CGRect(x: newRect.origin.x, y: newRect.origin.y, width: newRect.height, height: newRect.height)
		} else {
			drawRect = nil
			return newRect
		}
	}
	
	override open func drawText(in rect: CGRect) {
		if let drawRect = drawRect {
			super.drawText(in: drawRect.inset(by: textInsets))
		} else {
			super.drawText(in: rect.inset(by: textInsets))
		}
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
