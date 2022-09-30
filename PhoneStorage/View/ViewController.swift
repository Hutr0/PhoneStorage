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
    
    @IBAction func getAll(_ sender: UIButton) {
        tvc.mobiles = Array(vcManager.getAll())
        tableV.reloadData()
    }
    @IBAction func findByIMEI(_ sender: UIButton) {
        
        AlertManager.showAlertForFindByIMEI(vc: self) { imei in
            let result = self.vcManager.findByImei(imei)
            
            if result != nil {
                AlertManager.showInfoAlert(vc: self, title: "Mobile found", message: "IMEI: \(result!.imei)\nModel: \(result!.model)")
            } else {
                AlertManager.showInfoAlert(vc: self, title: "Mobile not found", message: "Mobile for written imei was not found")
            }
        }
    }
    @IBAction func deleteByIMEI(_ sender: UIButton) {
        AlertManager.showAlertWithTwoFieldsForDeleteMobile(s: self) { strings in
            do {
                try self.vcManager.delete(Mobile(imei: strings[0], model: strings[1]))
            } catch {
                print(error.localizedDescription)
                AlertManager.showInfoAlert(vc: self, title: "Error", message: error.localizedDescription)
            }
        }
    }
    @IBAction func exists(_ sender: UIButton) {
        AlertManager.showAlertWithTwoFieldsForCheckExistMobile(s: self) { str in
            let result = self.vcManager.exists(Mobile(imei: str[0], model: str[1]))
            
            var title: String = ""
            if result {
                title = "Exist"
            } else {
                title = "Not exist"
            }
            
            AlertManager.showInfoAlert(vc: self, title: title, message: "")
        }
    }
}

