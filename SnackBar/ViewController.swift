//
//  ViewController.swift
//  SnackBar
//
//  Created by mkns on 2017/08/28.
//  Copyright © 2017年 smakino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showButtonAction(_ sender: Any) {
        let manager = SnackBarManager.shared
        manager.show(title: "show test", button: .custom("bar"))
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        let manager = SnackBarManager.shared
        manager.hide()
    }
}

