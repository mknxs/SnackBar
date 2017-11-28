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
    var rightButtonAction: (() -> Void?)? = nil
    
    struct Config {
        static let AnimationDuration = 0.4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.hide(animated: false)
    }
    
    func show(set: SnackBarManager.SnackBarSet, animated: Bool) {
        self.setState(set: set)
        self.view.isHidden = false
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
            self.view.isHidden = true
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
    
    // MARK: - actions
    
    @IBAction func rightButtonAction(_ sender: Any) {
        self.rightButtonAction?()
        self.hide(animated: true)
    }
    
    // MARK: - priate
    
    fileprivate func setState(set: SnackBarManager.SnackBarSet) {
        self.titleLabel.text = set.title
        if let b = self.button {
            b.isHidden = set.button == SnackBarManager.SnackBarSet.Button.nothing
            b.isEnabled = !self.button.isHidden
            self.rightButtonAction = set.action
            
            if b.isEnabled {
                UIView.setAnimationsEnabled(false)
                b.setTitle(set.button.string, for: .normal)
                b.layoutIfNeeded()
                UIView.setAnimationsEnabled(true)
            }
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
