//
//  AlertManager.swift
//  PhoneStorage
//
//  Created by Леонид Лукашевич on 27.09.2022.
//

import UIKit

class AlertManager {
    
    static func showAlertWithTwoFieldsForDeleteMobile(s: ViewController, compltion: @escaping ([String]) -> ()) {
        let alert = UIAlertController(title: "Delete a mobile", message: "Write IMEI and Model for delete the mobile", preferredStyle: .alert)
        
        alert.addTextField() { tf in
            tf.placeholder = "IMEI"
        }
        
        alert.addTextField() { tf in
            tf.placeholder = "Model"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            let imei = alert.textFields![0] as UITextField
            let model = alert.textFields![1] as UITextField
            
            guard let imeiText = imei.text, let modelText = model.text else { return }
            compltion([imeiText, modelText])
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        s.present(alert, animated: true)
    }
    
    static func showAlertWithTwoFieldsForCheckExistMobile(s: ViewController, compltion: @escaping ([String]) -> ()) {
        let alert = UIAlertController(title: "Is the mobile exists", message: "Write IMEI and Model for check for existence the mobile", preferredStyle: .alert)
        
        alert.addTextField() { tf in
            tf.placeholder = "IMEI"
        }
        
        alert.addTextField() { tf in
            tf.placeholder = "Model"
        }
        
        let checkAction = UIAlertAction(title: "Check", style: .default) { action in
            let imei = alert.textFields![0] as UITextField
            let model = alert.textFields![1] as UITextField
            
            guard let imeiText = imei.text, let modelText = model.text else { return }
            compltion([imeiText, modelText])
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cancelAction)
        alert.addAction(checkAction)
        
        s.present(alert, animated: true)
    }
    
    static func showAlertForFindByIMEI(vc: ViewController, completion: @escaping (String) -> ()) {
        let alert = UIAlertController(title: "Find a mobile by IMEI", message: "Write the IMEI", preferredStyle: .alert)
        
        alert.addTextField() { tf in
            tf.placeholder = "IMEI"
        }
        
        let findAction = UIAlertAction(title: "Find", style: .default) { action in
            let imei = alert.textFields![0] as UITextField
            
            guard let imeiText = imei.text else { return }
            completion(imeiText)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(findAction)
        alert.addAction(cancelAction)
        
        vc.present(alert, animated: true)
    }
    
    static func showInfoAlert(vc: ViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        
        vc.present(alert, animated: true)
    }
}
