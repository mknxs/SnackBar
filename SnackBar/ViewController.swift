//
//  ViewController.swift
//  SnackBar
//
//  Created by mkns on 2017/08/28.
//  Copyright © 2017年 smakino. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = [String]()
    var temporaryDataSurce = [String]()
    
    struct Constants {
        static let CellIdentifier = "CellIdentifier"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.CellIdentifier)
        for i in 0..<10 { self.dataSource.append("Item\(i)") }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier, for: indexPath)
        cell.textLabel?.text = self.dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
 
        let manager = SnackBarManager.shared
        manager.show(title: "cell\(indexPath.row) tapped.", button: .close)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        self.temporaryDataSurce = self.dataSource
        self.dataSource.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        self.temporaryDataSurce = self.dataSource
        self.dataSource.append("Item\(self.dataSource.count)")
        tableView.insertRows(at: [IndexPath(row: self.dataSource.count - 1, section: 0)], with: .automatic)
    }
}

