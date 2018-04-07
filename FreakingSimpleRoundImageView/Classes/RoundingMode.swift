//
//  RoundingMode.swift
//  FreakingSimpleRoundImageView
//
//  Created by Anokhov Pavel on 07/04/2018.
//

import Foundation


/// Frame rounding mode
///
/// - rectangle: Regular square imare
/// - round: Round frame
/// - roundedCorners: Frame with custom corner radius
public enum RoundingMode {
	case rectangle
	case round
	case roundedCorners(radius: CGFloat)
}
