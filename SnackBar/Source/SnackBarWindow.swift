//
//  SnackBarWindow.swift
//  SnackBar
//
//  Created by mkns on 2017/08/29.
//  Copyright © 2017年 smakino. All rights reserved.
//

import UIKit

class SnackBarWindow: UIWindow {
    
    func setupDefaultSettings() {
        self.backgroundColor = UIColor.clear
        self.isOpaque = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupDefaultSettings()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupDefaultSettings()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
