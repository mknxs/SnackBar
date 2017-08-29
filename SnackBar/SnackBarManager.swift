//
//  SnackBarManager.swift
//  SnackBar
//
//  Created by mkns on 2017/08/29.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation
import UIKit

class SnackBarManager {
    
    static let shared = SnackBarManager()
    
    let window = SnackBarWindow(frame: .zero)
    let snackBarViewController = SnackBarViewController(nibName: nil, bundle: nil)
    
    init() {
        let w = self.window
        w.windowLevel = UIWindowLevelAlert
        var f = UIScreen.main.bounds
        let height: CGFloat = 40
        f.origin.y = f.size.height - height
        f.size.height = height
        w.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        w.frame = f
        w.rootViewController = self.snackBarViewController
        w.isHidden = false
    }
}
