//
//  DeviceConstraint.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/24/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import UIKit

class DeviceConstraint {
    // Base width in point, use iPhone 6
    static let base: CGFloat = 375
    
    static var ratio: CGFloat {
        return UIScreen.main.bounds.width / base
    }
}

extension CGFloat {
    var adjusted: CGFloat {
        return self * DeviceConstraint.ratio
    }
}

extension Double {
    var adjusted: CGFloat {
        return CGFloat(self) * DeviceConstraint.ratio
    }
}

extension Int {
    var adjusted: CGFloat {
        return CGFloat(self) * DeviceConstraint.ratio
    }
}
