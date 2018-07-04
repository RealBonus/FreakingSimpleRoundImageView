//
//  ViewController.swift
//  FreakingSimpleRoundImageView
//
//  Created by realbonus on 09/23/2017.
//  Copyright (c) 2017 realbonus. All rights reserved.
//

import UIKit
import FreakingSimpleRoundImageView

private let defaultAnimationDuration: TimeInterval = 0.2

class ViewController: UIViewController {
	
	/*
	A long long time ago...
	I ate a freakin' delicious pie.
	With lime, mint, cashew, Swift and Interface Builder support.
	Ah, good ol' days!
	*/
	
	
	// MARK: - IBOutlets
	
	@IBOutlet weak var accessoryView: AccessoryContainerView!
	@IBOutlet weak var imageView: RoundImageView!
	
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let recognizer = UITapGestureRecognizer(target: self, action: #selector(presentRoundingModeSwitcher))
		imageView.isUserInteractionEnabled = true
		imageView.addGestureRecognizer(recognizer)
		
		accessoryView.accessoriesBorderWidth = 3
		accessoryView.accessoriesBorderColor = UIColor.white
		accessoryView.accessoriesBackgroundColor = imageView.borderColor
		accessoryView.accessoriesFont = UIFont.systemFont(ofSize: 20)
		accessoryView.accessoriesContentInsets = UIEdgeInsets(top: 7, left: 15, bottom: 7, right: 15)
		accessoryView.accessoriesContainerInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		
		accessoryView.setAccessory(AccessoryType.label(text: "Top right!"), at: AccessoryPosition.topRight)
		accessoryView.setAccessory(AccessoryType.label(text: "1"), at: AccessoryPosition.bottomRight)
		accessoryView.setAccessory(AccessoryType.label(text: "Yay!"), at: AccessoryPosition.topLeft)
		accessoryView.setAccessory(AccessoryType.label(text: "Read books"), at: AccessoryPosition.bottomLeft)
	}
	
	
	// MARK: - Other
	
	@objc func presentRoundingModeSwitcher() {
		let alert = UIAlertController(title: "Rounding mode", message: nil, preferredStyle: .actionSheet)
		
		// MARK: Rectangle
		alert.addAction(UIAlertAction(title: "Rectangle", style: .default) { [weak self] _ in
			UIView.animate(withDuration: defaultAnimationDuration) {
				self?.imageView.roundingMode = .rectangle
			}
		})
		
		// MARK: Round
		alert.addAction(UIAlertAction(title: "Circle", style: .default) { [weak self] _ in
			UIView.animate(withDuration: defaultAnimationDuration) {
				self?.imageView.roundingMode = .round
			}
		})
		
		// MARK: Rounded corners
		alert.addAction(UIAlertAction(title: "Rounded corners", style: .default) { [weak self] _ in
			let radiusAlert = UIAlertController(title: "Corner radius", message: nil, preferredStyle: .alert)
			radiusAlert.addTextField(configurationHandler: { textField in
				textField.placeholder = "radius"
				textField.keyboardType = .numberPad
			})
			
			radiusAlert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
				guard let raw = radiusAlert.textFields?.first?.text, let radius = Double(raw) else {
					return
				}
				
				UIView.animate(withDuration: defaultAnimationDuration) {
					self?.imageView?.roundingMode = .roundedCorners(radius: CGFloat(radius))
				}
			})
			
			radiusAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
			self?.present(radiusAlert, animated: true, completion: nil)
		})
		
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		present(alert, animated: true, completion: nil)
	}
}
