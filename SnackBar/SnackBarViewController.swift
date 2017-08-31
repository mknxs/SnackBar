//
//  SnackBarViewController.swift
//  SnackBar
//
//  Created by mkns on 2017/08/29.
//  Copyright © 2017年 smakino. All rights reserved.
//

import UIKit

class SnackBarViewController: UIViewController {
    
    @IBOutlet weak var snackBarView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var snackBarHeight: NSLayoutConstraint!
    @IBOutlet weak var snackBarViewBottomMargin: NSLayoutConstraint!
    
    var hideSnackBarTimer: Timer? = nil
    
    struct Config {
        static let AnimationDuration = 0.4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.hide(animated: false)
    }
    
    func show(set: SnackBarManager.SnackBarSet, animated: Bool) {
        self.setState(set: set)
        self.snackBarView.isHidden = false
        self.snackBarViewBottomMargin.constant = 0
        let proc = { () -> () in
            self.snackBarView.superview?.layoutIfNeeded()
        }
        
        if animated {
            UIView.animate(withDuration: Config.AnimationDuration, animations: proc)
        } else {
            proc()
        }
    }
    
    func hide(animated: Bool, completion: (() -> Void)? = nil) {
        guard self.isShown else {
            completion?()
            return
        }
        
        self.snackBarViewBottomMargin.constant = -self.snackBarHeight.constant
        
        let proc = { () -> () in
            self.snackBarView.superview?.layoutIfNeeded()
        }
        
        let finishing = {
            self.clearState()
            self.snackBarView.isHidden = true
            completion?()
        }
        
        if animated {
            UIView.animate(withDuration: Config.AnimationDuration, animations: proc, completion: { (_) in
                finishing()
            })
        } else {
            proc()
            finishing()
        }
    }
    
    fileprivate func setState(set: SnackBarManager.SnackBarSet) {
        self.titleLabel.text = set.title
        self.button.isHidden = set.button == SnackBarManager.SnackBarSet.Button.nothing
        self.button.isEnabled = !self.button.isHidden
        if self.button.isEnabled {
            UIView.setAnimationsEnabled(false)
            self.button.setTitle(set.button.string, for: .normal)
            self.button.layoutIfNeeded()
            UIView.setAnimationsEnabled(true)
        }
        
        self.hideSnackBarTimer = Timer.scheduledTimer(withTimeInterval: set.lifeTime, repeats: false) { (_) in
            self.hide(animated: true, completion: nil)
        }
    }
    
    fileprivate func clearState() {
        self.titleLabel.text = nil
        self.button.isHidden = true
        self.button.isEnabled = false
        self.hideSnackBarTimer?.invalidate()
        self.hideSnackBarTimer = nil
    }
    
    fileprivate var isShown: Bool {
        return !self.snackBarView.isHidden
    }
}
