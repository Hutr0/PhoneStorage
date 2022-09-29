//
//  TableViewController.swift
//  PhoneStorage
//
//  Created by Леонид Лукашевич on 29.09.2022.
//

import UIKit

class TableViewController: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var mobiles: [Mobile] = []

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mobiles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        cell.imei.text = mobiles[indexPath.row].imei
        cell.model.text = mobiles[indexPath.row].model
        
        return cell
    }
}
