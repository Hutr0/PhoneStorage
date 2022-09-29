//
//  ViewController.swift
//  PhoneStorage
//
//  Created by Леонид Лукашевич on 27.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var vcManager = ViewControllerManager()
    var tvc = TableViewController()
    
    @IBOutlet weak var tableV: UITableView!
    @IBOutlet weak var stackV: UIStackView! {
        didSet {
            stackV.layer.cornerRadius = 16
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableV.delegate = tvc
        tableV.dataSource = tvc
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "addSegue" else { return }
        
        let addVC = segue.source as! AddViewController
        
        do {
            let result = try self.vcManager.save(addVC.mobile)
            print(result)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        AlertManager.showAlertWithTwoFields(s: self, title: "Save", message: "Write an info about mobile") { strings in
            let mobile = Mobile(imei: strings[0], model: strings[1])
            
            do {
                let result = try self.vcManager.save(mobile)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    @IBAction func getAll(_ sender: UIButton) {
        tvc.mobiles = Array(vcManager.getAll())
        tableV.reloadData()
    }
    @IBAction func findByIMEI(_ sender: UIButton) {
        let result = vcManager.findByImei("1")
    }
    @IBAction func deleteByIMEI(_ sender: UIButton) {
        do {
            try vcManager.delete(Mobile(imei: "imei", model: "1"))
        } catch {
            print(error.localizedDescription)
        }
    }
    @IBAction func exists(_ sender: UIButton) {
        let result = vcManager.exists(Mobile(imei: "1", model: "1"))
    }
}

