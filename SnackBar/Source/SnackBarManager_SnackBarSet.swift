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
            case nothing
            case close
            case undo
            case custom(String)
            
            var string: String {
                switch self {
                case .nothing:
                    return ""
                case .close:
                    return "close" // FIXME: 
                case .undo:
                    return "undo"   // FIXME: 
                case .custom(let s):
                    return s
                }
            }
            
            static func ==(v1: Button, v2: Button) -> Bool {
                switch (v1, v2) {
                case (.nothing, .nothing):
                    return true
                case (.close, .close):
                    return true
                case (.undo, .undo):
                    return true
                case (.custom(let s1), .custom(let s2)) where s1 == s2:
                    return true
                default:
                    return false
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
