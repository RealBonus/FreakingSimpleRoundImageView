//
//  AccessoryPosition.swift
//  FreakingSimpleRoundImageView
//
//  Created by Anokhov Pavel on 04.07.2018.
//

import Foundation

/// RoundImageView accessory position
///
/// - topLeft: top left corner
/// - topRight: top right corner
/// - bottomLeft: bottom left corner
/// - bottomRight: bottom right corner
/// - center: center
/// - custom: custom relative position, where x:0, y:0 - top left corner, x:1, y:1 - bottom right
public enum AccessoryPosition {
	case topLeft, topRight, bottomLeft, bottomRight, center
//	case custom(x: Double, y: Double) // Not implemented yet
}
