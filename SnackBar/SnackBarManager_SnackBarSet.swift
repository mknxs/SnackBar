//
//  SnackBarManager_SnackBarSet.swift
//  SnackBar
//
//  Created by mkns on 2017/08/29.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation

extension SnackBarManager {
    
    class SnackBarSet {
        
        var title: String
        var button: Button
        var lifeTime: TimeInterval
        var action: (() -> Void)? = nil
        
        enum Button {
            case close
            case undo
            case custom(String)
            
            var string: String {
                switch self {
                case .close:
                    return "close" // FIXME: 
                case .undo:
                    return ""   // FIXME: 
                case .custom(let s):
                    return s
                }
            }
        }
        
        init(title: String, button: Button, lifeTime: TimeInterval, action: (() -> Void)?) {
            self.title = title
            self.button = button
            self.lifeTime = lifeTime
            self.action = action
        }
    }
}
