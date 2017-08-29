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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func show(set: SnackBarManager.SnackBarSet, animated: Bool) {
        self.clearState()
        self.setState(set: set)
        self.snackBarViewBottomMargin.constant = 0
        let proc = { () -> () in
            self.snackBarView.superview?.layoutIfNeeded()
        }
        
        if animated {
            UIView.animate(withDuration: 0.5, animations: proc)
        } else {
            proc()
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
    }
    
    fileprivate func clearState() {
        self.titleLabel.text = nil
        self.button.isHidden = true
        self.button.isEnabled = false
    }
}
