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
        // TODO: 初期処理
    }
}
